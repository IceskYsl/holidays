# holidays

This is a holidays plugin for Redmine.

## Requirements

```
Ruby interpreter: 1.9.2, 1.9.3, 2.0.0
Redmine: 2.3.x
```

## Installation

To install the plugin, execute the following commands from the root of your Redmine directory:

```
cd plugins
git clone git@github.com:IceskYsl/holidays.git
```

and then execute the following commands from the root of your Redmine directory:

```
$ RAILS_ENV=production rake redmine:plugins:migrate
```	

More information on installing Redmine plugins can be found at [redmine.org](http://www.redmine.org/wiki/redmine/Plugins.).

After the plugin is installed you will need to restart Redmine for the plugin to be available.

### Uninstallation

To remove the plugin, from the root of your installation directory do the following:
```
ice@mac:/source/redmine/redmine-2.3 > RAILS_ENV=production rake redmine:plugins:migrate NAME=holidays VERSION=0
Migrating holidays (Holidays)...
==  CreateHolidays: reverting =================================================
-- remove_index("holidays", {:column=>:user_id})
   -> 0.1597s
-- drop_table("holidays")
   -> 0.0265s
==  CreateHolidays: reverted (0.1864s) ========================================
```

```
rm -rf plugins/holidays
bundle install
```

## Demo

![Demo](https://f.cloud.github.com/assets/5537/1296141/fad5423a-30c0-11e3-9442-3bc96bb3fadc.png)
