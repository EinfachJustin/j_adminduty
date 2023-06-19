# ADuty Resource

Aduty is a FiveM resource that allows players with specific permissions to toggle their duty status. When a player is on duty, they will have access to certain features or abilities in the game.

## Features

- Toggle duty status: Players with the appropriate permissions can use the `/aduty` command to switch between on-duty and off-duty status.
- Uniform and God Mode: When a player goes on duty, their character will be equipped with a predefined uniform and enabled God Mode for added protection.
- Permission Control: Only players with the 'license' have access to the `/aduty` command.

## Installation

1. Download the ADuty resource from [GitHub](https://github.com/your-username/aduty-resource).
2. Place the `aduty` folder in your FiveM server's `resources` directory.
3. Configure the permissions and Steam IDs in the `config.lua` file.
4. Add `ensure aduty` to your server.cfg file to start the resource when the server launches.

## Configuration

The configuration file (`config.lua`) allows you to customize the resource's behavior and permissions.

### Permissions

Edit the `authorizedLicenses` table to specify the Steam IDs that have access to the `/aduty` command. Make sure to provide the full license IDs in the format `license:0123456789abcdef`.

## Usage

To use the ADuty resource in-game:

1. Log in to your server as a player with the appropriate permissions.
2. Press the assigned command key (default is `/aduty`) to toggle your duty status.
3. When going on duty, your character will be equipped with a uniform and enabled God Mode.
4. When going off duty, your character will revert to their previous clothing and God Mode will be disabled.

## Credits

- Author: Justin 
- Discord: e1nfachjustin
- GitHub Repository: [Link to GitHub Repository](https://github.com/your-username/aduty-resource)

## License

This resource is released under the [MIT License](https://opensource.org/licenses/MIT). See the `LICENSE` file for more information.
