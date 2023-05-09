# Redmine Edit Author

Redmine plugin that allows to change the issue author on edit or creation.

## Installation

Follow standard Redmine plugin installation procedure.

 * Move `redmine_editauthor/` to `$REDMINE/plugins/`.


## Configuration

### Permissions

This plugin provides 2 permissions:

  * *Edit author*: allows to edit author of existing issue.
  * *Set original author*: allows to set author when creating new issue.

Authorized users will be able to see the "author" field and change its value in
the issue edit form.

### Settings

  * *Narrow authors to members*: Checkbox

By default users with global permissions such as administrators will be
listed even if they are not participants of the project. It is possible to
narrow possible authors to project members in plugin settings.

## Requirements

This plugin has been written with compatibility in mind to keep it
functional across many different versions of Redmine:

  * Redmine (`>= 3.0`)
