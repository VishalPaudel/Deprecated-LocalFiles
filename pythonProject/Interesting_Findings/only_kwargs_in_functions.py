
# The '*' represents the args, we use it to make the function only use **kwargs

def function(*,
             param1: str,
             param2: int
             ) -> None:

    print(param2, param1)

    return None


function(param1='5', param2=5)
