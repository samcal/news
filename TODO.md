#v1
* further reading options
* pick one type of navigation and boot the other
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


## How does Further Reading work?
- Automatic *unless* manual
- similar_articles() method on article class (already defined)
- TDA (tell don't ask)


## Navigation
- Go with side navigation for now
- Comment out top navigation
- Work for top navigation mobile integration and carousel functionality for v1.1
