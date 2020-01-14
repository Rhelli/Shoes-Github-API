# frozen_string_literal: true

# rubocop: disable all

require 'octokit'
require 'launchy'

class Gitshoes < Shoes
end

Shoes.app(width: 1280, height: 720, resizable: false, title: "GitShoes v1.0") do
  background "#FAFBFC"
  border "#525457".."#24292E", strokewidth: 12

  # TOP LEVEL - ICON, TITLE & SEARCH --------------------------------------------------------------------------------/
  stack(height: 60) do
    background "#24292E".."#2F3438"
    
    # LOGO --------------------------------------------------------------------------------/
    flow do
      stack width: "5%" do
        flow(height: 60) do
          image "#{DIR}/static/whitelogo.png", height: 50, width: 50, displace_left: 10, displace_top: 10
        end
      end

      # TITLE --------------------------------------------------------------------------------/
      stack width: "60%" do
        flow(width: "63%", height: 60, displace_top: 17, displace_left: 10) do
          title "GitShoes", width: 100, stroke: "#FCFCFC", font: "OpenSans normal 26"
          inscription "v1.0", stroke: white, font: "OpenSans normal 10"
        end
      end

      # SEARCH & INFORMATION BUTTON  --------------------------------------------------------------------------------/
      stack width: "35%" do
        flow(height: 60, displace_top: 24, displace_left: 19) do
          para "Search Github:", stroke: "#C8CACB", font: "OpenSans normal 11", displace_top: 2
          edit_line margin_left: 10, margin_right: 5
          button icon: "#{DIR}/static/search.png", width: 33, height: 24
          button icon: "#{DIR}/static/gitcons/information.png", width: 33, height: 24, displace_left: 25 do
            
            # INFORMATION POP UP  --------------------------------------------------------------------------------/
            window(height: 600, width: 900, resizable: false) do
              background "#EBECEC"
              border "#525457".."#24292E", strokewidth: 12

              # INFORMATION TITLE  --------------------------------------------------------------------------------/
              stack width: "100%" do
                background "#24292E".."#2F3438"
                flow(width: "63%", height: 60, displace_top: 17, displace_left: 10) do
                  title "GitShoes", width: 100, stroke: "#FCFCFC", font: "OpenSans normal 26"
                  inscription "v1.0", stroke: white, font: "OpenSans normal 10"
                end
              end

              # INFO TEXT  --------------------------------------------------------------------------------/
              stack(width: "100%") do
                background "#2F3438".."#525457"
                subtitle "Gitshoes is an open source, desktop based Github tool for programmers, built from Ruby, Shoes! 3 GUI & Github's API.", font: 'OpenSans.ttf normal 12', displace_left: 8, stroke: "#C8CACB"
              end
              stack(width: "100%", displace_left: 12, displace_top: 15) do
                subtitle "Why?", font: "OpenSans normal 16", low: "single"
              end
              stack(width: "100%", displace_left: 12, displace_top: 5) do
                para "As a programmer, my day always starts off with Github (minus three or four coffees) and it always ends with it.\nFor many programmers it is the same - so I set out to create a lightweight, minimal Github tool.", font: "Poppins normal 13"
              end
              stack(width: "100%", displace_left: 12) do
                subtitle "What?", font: "OpenSans normal 16", low: "single"
              end
              stack(width: "100%", displace_left: 12) do
                subtitle "Gitshoes allows you to access all your key Github information from your desktop, as well as perform a few well known actions. In Gitshoes v1.0 you can: ", font: "OpenSans normal 13"
              end
              stack(width: "100%", displace_left: 30) do
                para " - View Your Dashboard", font: "Poppins normal 11"
              end
              stack(width: "100%", displace_left: 30) do
                para " - View Your Profile ", font: "Poppins normal 11"
              end
              stack(width: "100%", displace_left: 30) do
                para " - View Your Notifications", font: "Poppins normal 11"
              end
              stack(width: "100%", displace_left: 30) do
                para " - View Your Existing Repositories", font: "Poppins normal 11"
              end
              stack(width: "100%", displace_left: 30) do
                para " - Create New Repositories", font: "Poppins normal 11"
              end
              stack(width: "100%", displace_left: 30) do
                para " - View Pull Requests", font: "Poppins normal 11"
              end
              stack(width: "100%", displace_left: 30) do
                para " - View Issues", font: "Poppins normal 11"
              end
              stack(width: "100%", displace_left: 30) do
                para " - Sign In/Sign Out", font: "Poppins normal 11"
              end
              stack(width: "100%", displace_left: 12) do
                subtitle "Who?", font: "OpenSans normal 16", low: "single"
              end
              stack(width: "100%", displace_left: 12) do
                para "Gitshoes was created by Rory Hellier, 2020.", font: "Poppins normal 11"
              end


            end
          end
        end
      end
    end
  end

  # NAVIGATION BUTTONS  --------------------------------------------------------------------------------/
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

      # LOGIN WINDOW --------------------------------------------------------------------/
      button "Log In", icon: "#{DIR}/static/gitcons/login.png", width: 120, margin_left: 20, background: "#525457".."#24292E", icon_pos: "left" do
        window(width: 500, height: 450, resizable: false, title: "Login") do
          background "#151E26".."#1C2833"
          border "#151E26".."#28333D", strokewidth: 12
          stack(width: 500, center: true, displace_left: 50, displace_top: 20) do
            image "#{DIR}/static/whitelogo.png", height: 60, width: 60, displace_left: 170, displace_top: 20
            title "Sign in to Github", stroke: white, font: "OpenSans normal 22", displace_top: 25, displace_left: 95
            flow(width: 450, center: true, displace_top: 20) do
              para "Username or email address", width: 450, stroke: white, displace_top: 15, displace_left: 4, font: "OpenSans normal 13"
            end
            flow(width: "80%", center: true) do
              edit_line(width: 380, center: true, displace_top: 30, displace_left: 8)
            end
            flow(width: "80%", center: true, displace_top: 45) do
              para "Password", width: 450, stroke: white, font: "OpenSans normal 13", displace_left: 4
              para link("Forgot Password?", click: proc {|btn, center, right|
                Launchy.open("https://github.com/password_reset")
                }), width: 450, displace_left: 176, stroke: white, font: "OpenSans normal 11"
            end
            flow(width: '80%', center: true, displace_top: 40, displace_left: 8) do
              edit_line(secret: true, width: 380, center: true)
            end
            button "Sign In", width: 380, height: 35, center: true, displace_top: 60, displace_left: 8, font: "Poppins normal 20" do
            end
            para link("Create an account", click: proc {|btn, center, right|
              Launchy.open("https://github.com/join?source=login")
              }), width: 450, displace_left: 127, displace_top: 90, stroke: white, font: "OpenSans normal 14"
          end
          end
            
      end
      button "Log Off", icon: "#{DIR}/static/gitcons/logout.png", width: 100, background: "#525457".."#24292E", icon_pos: "left" do
      end
    end
  end
end