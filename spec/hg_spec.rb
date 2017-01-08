require 'build-notifications/hg'
require 'mercurial-ruby'
require 'securerandom'
require 'hg_repo_helper'

module BuildNotifications
  describe Hg do
    let(:repo_helper) { HgRepoHelper.new(File.expand_path('../hg-repo', __FILE__)) }

    before(:all)do
      Mercurial.configure do |conf|
        conf.hg_binary_path = "/usr/bin/hg"
      end
    end

    it 'can show commits' do
      repo_helper.create_repo()
      commit1 = repo_helper.create_commit()
      commit2 = repo_helper.create_commit()

      hg = Hg.new(repo_helper.repo_path)
      commits = hg.commits(commit1, commit2)

      expect(commits[0].hash_id).to be == commit1
      expect(commits[1].hash_id).to be == commit2
    end
  end
end