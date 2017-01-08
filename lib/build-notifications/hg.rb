require 'mercurial-ruby'


module BuildNotifications
  class Hg
    def initialize(repo_path)
      @repo_path = repo_path
    end

    def commits(revision_from, revision_to)
      repository = Mercurial::Repository.open(repo_path)
      repository.commits.for_range(revision_from, revision_to)
    end

    private
    attr_reader :repo_path
  end
end