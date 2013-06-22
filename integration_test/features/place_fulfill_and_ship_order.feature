Feature: Fulfill order from inventory and ship to customer

  Scenario: Fulfill in stock item and ship to customer

    Given EStore has ordered "100" units of "Inferno" book with id "1" from "Penguin publishers"
    And all items are received from supplier "Penguin publishers" for product "1"
    And inventory is stocked with "100" units of "Inferno" book with id "1"
    When I add "Inferno" book with id "1" to my shopping cart
    And I checkout and place order
    Then Order gets fulfilled
    And Inventory quantity for "Inferno" book with id "1" must be "99" 
    And Delivery item must be created for "Inferno" book with id "1" for "1" quantity
