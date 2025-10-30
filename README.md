# Redmine Edit Author

A Redmine plugin that allows changing the issue author during editing or creation.

## Installation

Follow the standard Redmine plugin installation procedure:

 * Move the `redmine_editauthor/` directory to `$REDMINE/plugins/`.

## Configuration

### Permissions

This plugin provides 2 permissions:

  * *Edit author*: Allows editing the author of an existing issue.
  * *Set original author*: Allows setting the author when creating a new issue.

Authorized users will be able to see the "author" field and change its value in the issue edit form.

### Settings

  * *Narrow authors to members*: Checkbox

By default, users with global permissions (such as administrators) will be listed even if they are not members of the project. It is possible to limit the available authors to project members only in the plugin settings.
