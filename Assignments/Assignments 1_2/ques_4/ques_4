4. What happens when an enum variable is assigned with the last
valid value and the next method is used to do the next
assignment?
-----------------------------------------------------------------
ANSWER :
FOR EXAMPLE.,

typedef enum {RED, GREEN, BLUE} color_t;

color_t color;

initial begin
    color = BLUE;
    $display("Before next = %s", color.name());

    color = color.next();
    $display("After next = %s", color.name());
end

Output:

Before next = BLUE
After next = RED
