class Animal:
    def speak(self):
        return "Животное издает звук"

class Dog(Animal):
    def speak(self):
        return "Собака лает"

if __name__ == "__main__":
    print(Animal().speak())
    print(Dog().speak())
