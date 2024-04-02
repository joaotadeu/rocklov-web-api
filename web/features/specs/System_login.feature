@system_login
Feature: System Login

As a administrador
I want to login to the System
to manage the System

 @system_login_admin
 Scenario Outline: Log in to the system as a administrador successfully
    Given that administrador credentials are resgisted in the system
    When I log in using username "<username>" and password "<password>"
    Then login is successfull

    Examples:
        | username      | password |
        | admin         | @123     |
        | administrador | #123     |
        | menager       | $123     |
    