% Domains Declaration
DOMAINS
    response = string            % User response is of type string
    preference = symbol          % Laptop category preference

% Predicates Declaration
PREDICATES
    category(preference)                     % Handles the category selection
    q1_mac                                   % Handles Mac OS-specific query
    q2_portable                              % Handles portability query
    q3_touch_screen                          % Handles touch screen query
    q4_budget                                % Handles budget query
    q5_2_in_1                                % Handles 2-in-1 laptop query
    recommend(preference)                    % Recommend a laptop based on preference
    query                                    % Main query for interacting with the user
    write_recommendation(string)             % Outputs the recommended laptop
    handle_category(response)                % Handles user category input
    handle_mac_os(response)                  % Handles Mac OS preference
    handle_touch_bar(response)               % Handles Touch Bar query
    handle_portable(response)                % Handles portability query
    handle_touch_screen(response)            % Handles touch screen query
    handle_budget(response)                  % Handles budget query
    handle_2_in_1(response)                  % Handles 2-in-1 query
    handle_programming(response)             % Handles Competitive Programming query
    handle_gaming(response)                  % Handles Gaming preference query
    q1_programming                           % Programming query handler
    q1_gaming                                % Gaming query handler

% Clauses (Facts and Rules)
CLAUSES
% Laptop Recommendations
    recommend("Mac OS with Touch Bar") :-
        write_recommendation("Apple MacBook Pro 13 M2 Retina + Touch Bar").
    recommend("Mac OS without Touch Bar") :-
        write_recommendation("Apple MacBook Pro with M2 chip").
    recommend("Portable") :-
        write_recommendation("HP Pavilion 14-dv2022nx").
    recommend("Budget") :-
        write_recommendation("Acer Aspire 3 A315-56").
    recommend("2-in-1") :-
        write_recommendation("Microsoft Surface Pro 9 2-in-1 laptop").
    recommend("Competitive Programming MacBook") :-
        write_recommendation("Apple MacBook Air M2").
    recommend("Intel Programming Laptop") :-
        write_recommendation("Dell XPS 15 with Intel Core i7").
    recommend("MSI Gaming Laptop") :-
        write_recommendation("MSI GF65 Thin Gaming Laptop").
    recommend("Walton Gaming Laptop") :-
        write_recommendation("Walton Tamarind EX10").

% Main query logic
    query :-
        write("Welcome to the Laptop Recommendation System!"), nl,
        write("Please choose the category of laptop you are interested in:"), nl,
        write("1. Daily Use"), nl,
        write("2. Programming"), nl,
        write("3. Gaming"), nl,
        write("Enter your choice (e.g., 1 for Daily Use): "), readln(Input),
        handle_category(Input).

% Handle category input
    handle_category("1") :- category("Daily Use").
    handle_category("2") :- q1_programming.
    handle_category("3") :- q1_gaming.
    handle_category(_) :- write("Invalid input. Please try again."), nl, query.

% Programming Category Logic
    q1_programming :-
        write("Do you prefer Competitive Programming? (yes/no): "), readln(Input),
        handle_programming(Input).

handle_programming("yes") :- recommend("Competitive Programming MacBook").
handle_programming("no") :- recommend("Intel Programming Laptop").
handle_programming(_) :-
    write("Invalid input. Please answer with 'yes' or 'no'."), nl,
    q1_programming.

% Gaming Category Logic
    q1_gaming :-
        write("Do you do regular gaming? (yes/no): "), readln(Input),
        handle_gaming(Input).

handle_gaming("yes") :- recommend("MSI Gaming Laptop").
handle_gaming("no") :- recommend("Walton Gaming Laptop").
handle_gaming(_) :-
    write("Invalid input. Please answer with 'yes' or 'no'."), nl,
    q1_gaming.

% Daily Use Category Logic
    category("Daily Use") :-
        write("Do you prefer a Mac OS laptop? (yes/no): "), readln(Input),
        handle_mac_os(Input).

handle_mac_os("yes") :- q1_mac.
handle_mac_os("no") :- q2_portable.
handle_mac_os(_) :-
    write("Invalid input. Please answer with 'yes' or 'no'."), nl,
    category("Daily Use").

q1_mac :-
    write("Do you want a Touch Bar? (yes/no): "), readln(Input),
    handle_touch_bar(Input).

handle_touch_bar("yes") :- recommend("Mac OS with Touch Bar").
handle_touch_bar("no") :- recommend("Mac OS without Touch Bar").
handle_touch_bar(_) :-
    write("Invalid input. Please answer with 'yes' or 'no'."), nl,
    q1_mac.

q2_portable :-
    write("Do you need the laptop to be portable? (yes/no): "), readln(Input),
    handle_portable(Input).

handle_portable("yes") :- recommend("Portable").
handle_portable("no") :- q3_touch_screen.
handle_portable(_) :-
    write("Invalid input. Please answer with 'yes' or 'no'."), nl,
    q2_portable.

q3_touch_screen :-
    write("Do you prefer a touch screen? (yes/no): "), readln(Input),
    handle_touch_screen(Input).

handle_touch_screen("yes") :- q5_2_in_1.
handle_touch_screen("no") :- q4_budget.
handle_touch_screen(_) :-
    write("Invalid input. Please answer with 'yes' or 'no'."), nl,
    q3_touch_screen.

q4_budget :-
    write("Is your budget limited? (yes/no): "), readln(Input),
    handle_budget(Input).

handle_budget("yes") :- recommend("Budget").
handle_budget("no") :- recommend("Portable").
handle_budget(_) :-
    write("Invalid input. Please answer with 'yes' or 'no'."), nl,
    q4_budget.

q5_2_in_1 :-
    write("Do you want a 2-in-1 laptop? (yes/no): "), readln(Input),
    handle_2_in_1(Input).

handle_2_in_1("yes") :- recommend("2-in-1").
handle_2_in_1("no") :- q4_budget.
handle_2_in_1(_) :-
    write("Invalid input. Please answer with 'yes' or 'no'."), nl,
    q5_2_in_1.

% Helper predicate to output recommendations
write_recommendation(Laptop) :-
    write("The ideal laptop for you is: "), nl,
    write(Laptop), nl.

% Goal for the system to start
GOAL
    query.
