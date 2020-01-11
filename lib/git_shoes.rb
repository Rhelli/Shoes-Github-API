Shoes.app(width:1280, height: 720) {
  background "#24292E"
  stack {
    background "#302C2C".."#433D3D"
    banner "GITSHOES", width: 100, stroke: white
  }

  stack(margin: 60) {
    para "Search Github"
    flow do
      edit_line
      button "Go"
    end
  }
  
  
  stack(margin: 10) {
    button("GitHub Homepage")
    button("Profile")
    button("Notifications")
    button("Current Repositories")
    button("New Repository")
    button("Pull Requests")
    button("Isssues")
    button("Github Search")
  }
}