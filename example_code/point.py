import math

class Point: 
    """
        Initiates a new Point instance: x and y are coordinates in 2d space that represent the Point's postition.
        If a new Point is instantiated without any x or y values given, it will be assigned to the origin (0,0)
    """
    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y

    def reset(self):
        "Sets a Point instance's position to the origin (0,0)"
        self.x = 0
        self.y = 0

    def move(self, x, y):
        """
         Allows you to manually set coordinates for an instance of a Point class to given x and y values. 
         Once set, the name of the Point being moved and it's new coordinates are printed.
        """
        self.x = x
        self.y = y
        self.show()

    def show(self):
        "Prints the Point instance's variable name next to it's coordinates"
        print(f"{self.namestr()}: {self.x}, {self.y}")

    def namestr(self):
        "Return's the variable name of the Point instance"
        namespace = globals()
        return [name for name in namespace if namespace[name] is self]

    def calculate_distance(self, other_point):
        "Calculates the distance between this Point instance and another given Point instance 'other_point' using the Pythagorean theorem and prints a distance message."
        distance = math.sqrt((self.x - other_point.x)**2 + (self.y - other_point.y)**2)
        print(f"Distance from {self.namestr()} and {other_point.namestr()}: {distance}")

p1 = Point()
p1.show()

p2 = Point()
p2.show()

p1.move(1,5)
p2.move(3,6)

p1.calculate_distance(p2)
p2.calculate_distance(p1)


