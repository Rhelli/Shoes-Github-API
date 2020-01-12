Shoes.app(width:1280, height: 720) do
  background "#FFF"
  border "24292E", strokewidth: 8
  stack do
    flow do
      background "#24292E"
      image "static/icon_64.png"
      subtitle "GitHome", width: 100, stroke: white
      para "Search", stroke: white
      edit_line
      button "Go"
    end
  end

  stack do
    background "#3F4448"
    flow do
      button("GitHub Homepage")
      button("Profile")
      button("Notifications")
      button("Current Repositories")
      button("New Repository")
      button("Pull Requests")
      button("Isssues")
      button("Github Search")
    end
  end
end