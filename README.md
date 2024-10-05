# esx_jonis_applerobbery

Apple Store Robbery script for FiveM (ESX framework) with a custom map.

![Apple Robbery](https://i.postimg.cc/NMyTtdyS/APPLE-ROBBERY.png)

## Features 💿
- Custom Apple Store map (`applemap`)
- Apple Store robbery script (`esx_applerobbery`)
- Includes 2 dependencies for notifications and pawn shop functionality

## Dependencies 💻
This repository contains the following dependencies required for the robbery script:
1. **r3_notifications**: Used for sending in-game notifications.
2. **jonisapplesell**: Allows players to sell stolen items from the Apple Store at a pawn shop.

## Installation Instructions 📋
1. **Clone the repository** into your server's resources folder:
   ```sh
   git clone https://github.com/Losjonis/esxapplerobbery.git
   ```
2. **Add the resources** to your `server.cfg`:
   ```txt
   start applemap
   start r3_notifications
   start jonisapplesell
   start esx_applerobbery
   ```
3. **Import the SQL file** (`esx_applerobbery/esx_applerobbery.sql`) into your database to add the necessary items and configurations.

## Configuration ⚙️
- You can configure various aspects of the robbery and pawn shop in the following files:
  - **`esx_applerobbery/config.lua`**: Change settings related to the robbery (e.g., rewards, robbery duration, police requirements).
  - **`r3_notifications/config.lua`**: Configure notification settings.
  - **`jonisapplesell/config.lua`**: Configure pawn shop locations and prices.

## License 📄
This project is licensed under the terms of the **MIT License**. See the [LICENSE](LICENSE) file for details.

## Credits ✌🏻
- Script developed by **Jonis**.
- Custom map included.

## Support 🌎
For any questions or support, add me on Discord!: **nosoyjonis**.
