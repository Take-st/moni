# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

require 'spec_helper'

RSpec.describe Slack::Web::Api::Endpoints::AdminUsers do
  let(:client) { Slack::Web::Client.new }
  context 'admin.users_assign' do
    it 'requires team_id' do
      expect { client.admin_users_assign(user_id: '') }.to raise_error ArgumentError, /Required arguments :team_id missing/
    end
    it 'requires user_id' do
      expect { client.admin_users_assign(team_id: '') }.to raise_error ArgumentError, /Required arguments :user_id missing/
    end
  end
  context 'admin.users_invite' do
    it 'requires channel_ids' do
      expect { client.admin_users_invite(email: 'joe@email.com', team_id: '') }.to raise_error ArgumentError, /Required arguments :channel_ids missing/
    end
    it 'requires email' do
      expect { client.admin_users_invite(channel_ids: 'C1A2B3C4D,C26Z25Y24', team_id: '') }.to raise_error ArgumentError, /Required arguments :email missing/
    end
    it 'requires team_id' do
      expect { client.admin_users_invite(channel_ids: 'C1A2B3C4D,C26Z25Y24', email: 'joe@email.com') }.to raise_error ArgumentError, /Required arguments :team_id missing/
    end
  end
  context 'admin.users_list' do
    it 'requires team_id' do
      expect { client.admin_users_list }.to raise_error ArgumentError, /Required arguments :team_id missing/
    end
  end
  context 'admin.users_remove' do
    it 'requires team_id' do
      expect { client.admin_users_remove(user_id: 'W12345678') }.to raise_error ArgumentError, /Required arguments :team_id missing/
    end
    it 'requires user_id' do
      expect { client.admin_users_remove(team_id: '') }.to raise_error ArgumentError, /Required arguments :user_id missing/
    end
  end
  context 'admin.users_setAdmin' do
    it 'requires team_id' do
      expect { client.admin_users_setAdmin(user_id: 'W12345678') }.to raise_error ArgumentError, /Required arguments :team_id missing/
    end
    it 'requires user_id' do
      expect { client.admin_users_setAdmin(team_id: '') }.to raise_error ArgumentError, /Required arguments :user_id missing/
    end
  end
  context 'admin.users_setExpiration' do
    it 'requires expiration_ts' do
      expect { client.admin_users_setExpiration(team_id: '', user_id: 'W12345678') }.to raise_error ArgumentError, /Required arguments :expiration_ts missing/
    end
    it 'requires team_id' do
      expect { client.admin_users_setExpiration(expiration_ts: '1234567890', user_id: 'W12345678') }.to raise_error ArgumentError, /Required arguments :team_id missing/
    end
    it 'requires user_id' do
      expect { client.admin_users_setExpiration(expiration_ts: '1234567890', team_id: '') }.to raise_error ArgumentError, /Required arguments :user_id missing/
    end
  end
  context 'admin.users_setOwner' do
    it 'requires team_id' do
      expect { client.admin_users_setOwner(user_id: '') }.to raise_error ArgumentError, /Required arguments :team_id missing/
    end
    it 'requires user_id' do
      expect { client.admin_users_setOwner(team_id: '') }.to raise_error ArgumentError, /Required arguments :user_id missing/
    end
  end
  context 'admin.users_setRegular' do
    it 'requires team_id' do
      expect { client.admin_users_setRegular(user_id: 'W12345678') }.to raise_error ArgumentError, /Required arguments :team_id missing/
    end
    it 'requires user_id' do
      expect { client.admin_users_setRegular(team_id: '') }.to raise_error ArgumentError, /Required arguments :user_id missing/
    end
  end
end