class Student:
    def __init__(self, name, age, secret):
        self.name = name
        self._age = age
        self.__secret = secret
    
student = Student("John", 18, "secret")
print(student.name)  # 输出: John
print(student._age)  # 输出: 18
# print(student.__secret)  # 输出: AttributeError: 'Student' object has no attribute '__secret'