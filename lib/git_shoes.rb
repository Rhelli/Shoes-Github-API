Shoes.app(width:1280, height: 720) do
  background "#FFF"
  border "#525457".."#24292E", strokewidth: 12

  stack(height: 60) do
    background "#24292E".."#2F3438"
    flow do
      stack width: "5%" do
        flow(height: 60) do
          image "#{DIR}/static/whitelogo.png", height: 50, width: 50, displace_left: 5, displace_top: 5
        end
      end

      stack width: "65%" do
        flow(width: "63%", height: 60, displace_top: 5) do
          subtitle "GitShoes", width: 100, stroke: white
        end
      end

      stack width: "30%" do
        flow(height: 60, displace_top: 18, displace_left: 45) do
          para "Search", stroke: white
          edit_line margin_left: 10, margin_right: 5
          button icon: "#{DIR}/static/search.png", width: 33, height: 24
        end
      end
    end
  end

  stack(height: 60) do
    background "#2F3438".."#525457"
    flow(width: 1280, displace_top: 15, displace_left: 80) do
      button("GitHub Home")
      button("Profile")
      button("Notifications")
      button("Current Repositories")
      button("New Repository")
      button("Pull Requests")
      button("Isssues")
      button("Log In")
      button("Log Out")
    end
  end
end