# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

desc 'AdminTeams methods.'
command 'admin_teams' do |g|
  g.desc 'Create an Enterprise team.'
  g.long_desc %( Create an Enterprise team. )
  g.command 'create' do |c|
    c.flag 'team_domain', desc: 'Team domain (for example, slacksoftballteam).'
    c.flag 'team_name', desc: 'Team name (for example, Slack Softball Team).'
    c.flag 'team_description', desc: 'Description for the team.'
    c.flag 'team_discoverability', desc: "Who can join the team. A team's discoverability can be open, closed, invite_only, or unlisted."
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.admin_teams_create(options))
    end
  end

  g.desc 'List all teams on an Enterprise organization'
  g.long_desc %( List all teams on an Enterprise organization )
  g.command 'list' do |c|
    c.flag 'cursor', desc: 'Set cursor to next_cursor returned by the previous call to list items in the next page.'
    c.flag 'limit', desc: 'The maximum number of items to return. Must be between 1 - 100 both inclusive.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.admin_teams_list(options))
    end
  end
end
