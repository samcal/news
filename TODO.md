#v1
* navigation work with mobile also ✓
* submission (editor vs. writer) management

## Editor & Writer Management
- Editors are in control of who is an editor, and which writer's are assigned
- Editor can promote writer to editor
- Editor can promote user to writer
- Editor can put a writer in their group
- If you are the first user you are automatically an editor

### Possible Chicken-Egg Implementations
- User pid 1 -> always editor
- On creation, if the user is the first user (only user) -> create them as an editor
- Probably will be only user, as only user does not always have pk=1

=
#v1.1
* tags using comments in markdown
* scroll-up button
* further reading options


## How does Further Reading work?
- expose keywords function
- add search
- search for keywords on Further reading
