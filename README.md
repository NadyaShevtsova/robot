# Robot Challenge

It is an example of application that simulat a toy robot moving on a 5 x 5 unit tabletop. 

## Installation
The application has been developed on Ruby 3.2.2

```
$ git clone https://github.com/NadyaShevtsova/robot.git
$ cd robot
$ bundle install
```

## Run instructions

Run the program with command below:
```
ruby main.rb
```

To exit input need to input command `exit`

Or you can run it with using the sample data file (input.txt) with the following command:

```
cat input.txt | ruby main.rb
```

In `main.rb` instantiates a new `Table` with default size `5x5`, new `Robot` and new `Input`. The new `Table` is assigned to `table` of new `Robot`, which is initialised with `nil` coordinates and orientation untill will be received a first command `PLACE` with valid agruments. New robot is assigned to the robot of `Input` class.

The `#read` method of `Input` class receive string and check if the command is valid. Command is valid if it's amoung the list of the commands which are represented by the classes in namespace Commands. Also first valid command is allowed only for `PLACE` vith valid arguments. Argumends are valid if `x_coordinate` and `y_coordinate` are within the table size.

Once first valid command received - new coordinates are assigned to `Robbot` coordinates. Then other valid commands can be treated. When receive other valid commands `Input` class invoke method `#perform` of this class command and check if argumets are valid and for some commands like `Move` or `Place` also check if `Robot` still will be on a `Table` if command will be performed.

This process continues until an `"exit"` command is received, breaking the loop.


## Testing

```
$ bundle exec rspec
```
-----------
## Challenge Description

- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement
  that would result in the robot falling from the table must be prevented, however further valid movement commands must still
  be allowed.

Create an application that can read in commands of the following form:

```plain
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
MOVE
REPORT
```

- PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.
- MOVE will move the toy robot one unit forward in the direction it is currently facing.
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
- REPORT will announce the X,Y and orientation of the robot.
- A robot that is not on the table can choose to ignore the MOVE, LEFT, RIGHT and REPORT commands.
- The application must not exit after the first REPORT command, i.e. many REPORT commands can be received per session.
- It is up to you how you exit the application (e.g. exit command, Ctrl-C etc.)
- Provide test data to exercise the application.

## Constraints

The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.

Example Input and Output:

```plain
PLACE 0,0,NORTH
MOVE
REPORT
Output: 0,1,NORTH
```

```plain
PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST
```

```plain
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH
```

## Deliverables

The source files, the test data and any test code (as well as explanations of how to run everything).