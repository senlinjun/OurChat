# Changelog

All notable changes to this project will be documented in this file.

## [0.1.0-alpha.2] - 2025-06-01

### 🚀 Features

- *(server)* Add /_matrix/client/versions endpoint
- *(server)* Implement /.well-known/clients and /.well-known/support
- *(server)* Follow matrix spec to configure the CORS
- *(server)* Add support endpoint for oc api
- *(server)* Read the env var from .env file
- *(server)* Add validation for register and set_self_info endpoints
- *(server)* Add more checks for join_in_session endpoint
- *(server)* Add mergeable config file
- *(server)* Export server_info.json from docker image
- *(server)* Backup the server_info.json first
- *(server)* Implement soft unregister
- *(server)* Save user_defined_status in redis and add a expire time.
- *(server)* Preset Status and Time format
- *(server)* Add the test of the user-defined status' expire time.
- *(server)* Add the announcement adding function.
- *(server)* Change the migration format.
- *(server)* Change timestamp to timestamp_with_timezone in migration.
- *(server)* Add the publish_announcement function
- *(server)* Finish the tls in grpc part.
- *(client)* Add log configuration to setting menu
- *(server)* Change display_name's behaviour when missing
- *(client)* Log out, search&show user's information, add friend
- *(server)* Add some consts to config file
- *(server)* Delete log automatically

### 🐛 Bug Fixes

- *(server)* Fix /v1/logo endpoint
- *(server)* Permission implementation of add_role is missing
- *(client)* Add the compilation support of other platforms
- *(server)* Display error of rpc server itself
- *(server)* Compilation error
- *(client)* Fix grpc analysis
- *(client)* Fix the issue of no response after successful registration
- *(client)* Fix the ui layout issue in setting
- *(client)* Fix the tab order issue in home(desktop)
- *(script)* Incorrect progress bar

### 🚜 Refactor

- *(server)* Optimize the token check error report
- *(server)* Split utils from base and integrate time into pb

### ⚡ Performance

- *(client)* Remove redundant Interceptor

### 🧪 Testing

- *(server)* Fix merge config test
- *(server)* Fix macos test
- *(server)* Add log clean test
- *(server)* Fix test ci
- *(server)* Add zero timestamp message receive test

### ⚙️ Miscellaneous Tasks

- Split alpine and debian test
- Remove port export by default
- Skip duplicated actions
- Add clippy check and split ci into server part and client part

## [0.1.0-alpha.1] - 2025-02-07

### 🚀 Features

- *(client-pc)* Login/register
- *(client-pc)* Setting
- *(client-pc)* Add time in when putout log
- *(client-pc)* Added configuration and log cleanup functionality
- *(client-pc)* Session_list and session_box
- *(client-pc)* Improve "About"
- *(client-pc)* Show Message in UI
- *(server)* Server manager system init
- *(server)* Server config
- Improve scripts' system error
- *(client-pc)* Send/recv user message
- *(server)* Basic sqlite support
- *(server)* Init sqlite support
- *(server)* Fit new status design[skip ci]
- *(server)* Sqlite support
- *(server)* Add maintaining mode
- *(server)* Add get_status to verify stage
- *(server)* Add help,setstatus,getstatus command
- *(server)* Use relative path for config file
- *(client-pc)* Assign keyboard shortcuts in the UI
- *(server)* More file upload support
- *(client-pc)* Implemented the functionality of sending messages with "Enter" and creating a new line with "Ctrl+Enter"
- *(client-pc)* Search session
- *(server)* Add foreign key of user id in files table
- *(server)* Add status api
- *(server)* Change config type to toml
- *(server)* Add newtype ID to fit two db
- *(server)* Add file_size option
- *(server)* Add network cmd
- *(client-pc)* Add "size" parameter for upload
- *(server)* Support more config type
- *(server)* Basic support of verification
- Remove client written in python
- *(server)* Finish verify
- Use argon2id to store password
- *(client)* Add ui of login
- Add linux target
- *(client)* Improve login and register ui
- *(client)* Keep input values when UI changes
- Finish verify
- Cleanup useless notifier regularly
- Basically finish session creation
- Basically finish new session
- *(server)* Define new info struct
- *(client)* Add localization support for Ourchat client
- Add a timestamp endpoint returns timestamp using rfc3339 standard
- *(server)* Basically finish get_user_info
- *(server)* Finish get info
- *(server)* Finish set account info
- *(client)* Setting
- *(server)* Add friend info set feature
- *(client)* Home page
- *(client)* Implement the session_list and session_record interfaces (no functionality)
- *(server)* Finish fetch msgs feature
- *(client)* Multi-device Adaptation
- *(server)*Add verify feature
- Upload and download
- *(server)* Add fetch_msg_page_size as 2000 into config file
- *(server)* Add verification_expire_days as 3 into config file
- *(server)* Finish a TODO about moving factors to config
- *(server)* Change default_output_len from Some(32) to None
- *(server)* Add files_storage_path into config file
- *(server)* Add ssl support
- *(server)* Set avatar of account
- *(server)* Transform download files_storage_path into pathbuf
- *(server)* Add cleaning files according to date
- *(server)* Enhance the log and the debug console
- *(client)* Added navigation bar to the home interface and adapted for multi-device compatibility
- *(server)* Add ocid returning when auth
- *(server)* Finish fetch msgs feature
- *(client)* Multi-device Adaptation
- *(server)* Remove http file part
- Add protobuf definitions
- *(server)* Basically recall feature
- *(client)* Get account info
- *(server)* Multiple of config file are supported
- *(server)* Basic support of session info
- *(server)* Add set_session_info endpoint
- *(server)* Add server name for GetServerInfo endpoint
- *(server)* Add add_role endpoint
- *(client)* Auth&connect
- *(server)* Add add_friends, accept_friend, ban and mute endpoints
- *(server)* Add leave_session endpoint
- *(server)* Add delete_session endpoint
- *(client)* Add friend feature
- *(server)* Add server_info_json_version and the updating function.
- *(server)* Add join_in_session endpoint
- *(server)* Implement delete_friend endpoint
- *(server)* Add join_in_session notification
- *(server)* Implement add_friend endpoint

### ⚙️ Miscellaneous Tasks

- *(server)* Add rust test
- Add python check
- Add flutter check
- Delete python client script
- Break change detector
- *(server)* Add docker publish action
- *(server)* Add test for macOS

<!-- generated by git-cliff -->
