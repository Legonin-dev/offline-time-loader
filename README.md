# offline-time-loader
This is a module for Roblox Studio that can calculate how long the player has been offline in your place.
*WARNING*
This requires enabling the datastore.

In order to get the time in which the player was offline, you first need to require this module.
local offline_time_module = require(YOUR_MODULE_DIRECTION))

And then we need to access it with the getPlayerOfflineTime function.
offline_time_module.getPlayerOfflineTime(user_id)

It returns player`s offline time in seconds!

You also get this module from toolbox - https://create.roblox.com/store/asset/112485855597285/offlinetimemodule
