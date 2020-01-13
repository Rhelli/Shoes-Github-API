# frozen_string_literal: true

# rubocop: disable all

Shoes.app(width: 1280, height: 720) do
  background "#FAFBFC"
  border "#525457".."#24292E", strokewidth: 12

  stack(height: 60) do
    background "#24292E".."#2F3438"
    flow do
      stack width: "5%" do
        flow(height: 60) do
          image "#{DIR}/static/whitelogo.png", height: 50, width: 50, displace_left: 10, displace_top: 10
        end
      end

      stack width: "65%" do
        flow(width: "63%", height: 60, displace_top: 17, displace_left: 10) do
          title "GitShoes", width: 100, stroke: "#FCFCFC", font: "OpenSans normal 26"
          inscription "v1.0", stroke: white, font: "OpenSans normal 10"
        end
      end

      stack width: "30%" do
        flow(height: 60, displace_top: 24, displace_left: 45) do
          para "Search", stroke: "#C8CACB", font: "OpenSans normal 11", displace_top: 2
          edit_line margin_left: 10, margin_right: 5
          button icon: "#{DIR}/static/search.png", width: 33, height: 24
        end
      end
    end
  end

  stack(height: 60) do
    background "#2F3438".."#525457"
    flow(width: 1280, displace_top: 18, displace_left: 8) do
      button "Dashboard", icon: "#{DIR}/static/gitcons/home.png", width: 130, icon_pos: "left" do
      end
      button "Profile", icon: "#{DIR}/static/gitcons/profile.png", width: 130, margin_left: 7, icon_pos: "left" do
      end
      button "Notifications", icon: "#{DIR}/static/gitcons/notifications.png", width: 150, margin_left: 7, icon_pos: "left" do
      end
      button "Current Repositories", icon: "#{DIR}/static/gitcons/repos.png", width: 190, margin_left: 7, icon_pos: "left" do
      end
      button "Create Repository", icon: "#{DIR}/static/gitcons/new.png", width: 170, margin_left: 7, icon_pos: "left" do
      end
      button "Pull Requests", icon: "#{DIR}/static/gitcons/prs.png", width: 150, margin_left: 7, icon_pos: "left" do
      end
      button "Issues", icon: "#{DIR}/static/gitcons/issues.png", width: 120, margin_left: 7, icon_pos: "left" do
      end
      button "Log In", icon: "#{DIR}/static/gitcons/login.png", width: 120, margin_left: 20, background: "#525457".."#24292E", icon_pos: "left" do
      end
      button "Log Off", icon: "#{DIR}/static/gitcons/logout.png", width: 100, background: "#525457".."#24292E", icon_pos: "left" do
      end
    end
  end
end