Feature: Song Management
  As a jukebox owner
  I need to be able to add songs
  So that you know, people can pay to listen

  Scenario: Adding Songs
    Given I am on the add songs page
    When I add "2 Legit 2 Quit"
    Then I should be on the all songs page
    And I should see "2 Legit 2 Quit"

  Scenario: Adding Artis with Song
    Given I am on the add songs page
    When I add song "Song 2" with artist "Blur"
    Then I should see "Song 2" by "Blur" on the Jukebox page