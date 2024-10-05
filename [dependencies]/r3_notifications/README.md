## r3_notifications
This resource was made to handle notifications for a couple of my plugins. It can also be used by any other resource.

## Features
* Make sure all your plugins send out the same type of notifications
* Easy configuration
* Possibility to add more notification plugins

## Dependencies
* [ESX](https://github.com/ESX-Org/es_extended/tree/v1-final) or [EXM](https://github.com/extendedmode/extendedmode) Optional for ESX notification
* [mythic_notify](https://github.com/JayMontana36/mythic_notify) Optional for mythic notification
* [rdrp_notifications](https://github.com/qalle-fivem/rdrp_notifications) Optional for rdrp notification

## How to use

In the config.lua select a notification type.
Possible notification types: esx, chat, mythic and rdrp.

To send out a notification use the following event and/or export:

For triggering from server side:
```
TriggerClientEvent("r3_notifications:client:sendNotification", target, msg, style, duration)
```

For triggering from client side:
```
exports["r3_notifications"]:clientSendNotification(msg, style, duration)
```

### Parameters

| Parameter | Description |
|-----------|-------------|
| target | Who should get a notification, this is mostly source. |
| msg | What should the notification say. "This is the format change this to your text" |
| style | Only applies to specific notification types, for example for mythic_notify you can choose between "error", "success" or "inform" |
| duration | Only applies to specific notification types, this would be how long a notification should show in miliseconds.  |

## Download & Installation

### Using Git
```
cd resources
git clone https://github.com/r3ps4J/r3_notifications
```

### Manually
- Download this resource and put it in your resources folder.

## Installation
- Add this to your `server.cfg`:

```
ensure r3_notifications
```

## Discord:
If you want to contact me or require help you could join my discord server, I can't guarantee that I will be able to help you.
* [Discord Server](https://discord.gg/bEWmBbg)

## Legal

I'll paste something regarding a license down here.
Any changes to this script should link back to me. You can always make a pull request if you have good extra stuff like new types of notifications.

### License
r3_notifications - Notification manager.

Copyright (C) 2020 r3ps4J

This program Is free software: you can redistribute it And/Or modify it under the terms Of the GNU General Public License As published by the Free Software Foundation, either version 3 Of the License, Or (at your option) any later version.

This program Is distributed In the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty Of MERCHANTABILITY Or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License For more details.

You should have received a copy Of the GNU General Public License along with this program. If Not, see http://www.gnu.org/licenses/.
