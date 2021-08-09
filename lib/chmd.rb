# frozen_string_literal: true

require 'English'
require 'mkmf'

MakeMakefile::Logging.quiet = true

module MakeMakefile
  # MakeMakefile::Logging
  module Logging
    @logfile = File::NULL
  end
end

# atext
module Chmd
  class << self
    def make
      Make.new.make
    end
  end

  # class for making changelog.md
  class Make
    attr_reader :remote_url, :tags

    def initialize
      @remote_url = self.class.set_remote
      @tags = self.class.set_tags
    end

    def make
      ['# Changelog'] | @tags.map do |tag, commits|
        next unless tag =~ /tag: /

        _, timestamp, = commits.first.map(&:strip)
        tag_name = tag.scan(/(?<=tag: )[^,]+/).first
        prev_tag_name = self.class.get_prev_tag_name(@tags, tag)
        tag_info = self.class.parse_tag_info(tag_name, prev_tag_name, @remote_url, timestamp)
        tag_commits_info = self.class.parse_tag_commits(commits, @remote_url).compact
        ['', tag_info, '', tag_commits_info]
      end.compact
    end
    class << self
      def parse_tag_info(tag_name, prev_tag_name, remote_url, timestamp)
        "## [#{tag_name}](#{remote_url}/releases/tag/#{tag_name}) " \
            + "- #{timestamp} ([compare](#{remote_url}/compare/#{prev_tag_name}...#{tag_name}))"
      end

      def get_prev_tag_name(tags, current_tag)
        (
          tags.keys[tags.keys.index(current_tag) + 1] \
          ||= tags.values.last.last.first
        ).sub('tag: ', '')
      end

      def parse_tag_commits(commits, remote_url)
        commits.map do |hash, _, msg|
          if msg =~ /changelog/i
            nil
          else
            <<~A
              - [#{hash}](#{remote_url}/commit/#{hash})
                - #{msg}
            A
          end
        end
      end

      def set_tags
        ref = nil
        tags = {}
        logs = `git log --pretty=format:"%H	%ad	%s	%D" \
                --date=format:'%Y-%m-%d %H:%M:%S'`.split "\n"
        logs.map { _1.split "\t" }.each do |c|
          ref = c[-1] unless c[3].nil?
          tags[ref] = tags[ref].nil? ? [c[0, 3]] : tags[ref] + [c[0, 3]]
        end
        tags
      end

      def set_remote
        check_git_command_exist
        check_git_remote_is_github
        remote_urls = `git remote get-url origin`.split("\n").grep(/github\.com/)
        unless remote_urls.size == 1
          warn 'Error: remote origin is not on github.com.'
          exit 1
        end
        remote_urls[0].sub(/.git$/, '')
      end

      def check_git_command_exist
        return if find_executable 'git'

        warn 'Error: Git is not installed.'
        exit 1
      end

      def check_git_remote_is_github
        system 'git rev-parse --show-toplevel', %i[out err] => File::NULL
        return if $CHILD_STATUS.success?

        warn 'Error: You are outside git repo.'
        exit 1
      end
    end
  end
end
