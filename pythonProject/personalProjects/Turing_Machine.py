
"""
Future: (important) Adding cool visual end, with turing machine and tape. (urgent) self.instructions extracted from tape

Author: Vishal Paudel (2003)
Motivation: The Emperor's New Mind, Roger Penrose (Chapter 2: Algorithms and Turing Machines)
Scope: The current one only runs UN*2

Last Edit: February 17, 2021 (Probably giving astrological data makes more sense, that is, if worlds change)

Note: My usual defensive programming, I have to have more knowledge than a first sem, to comment on the implementation
"""


class TuringMachine:
    """An object that does what a Turing machine does"""

    def __init__(
            self,
            infinite_tape: str
    ):
        """
        An initiation for a turing machine object
        :param infinite_tape: A string containing 1s and 0s only
        """
        for temp_index in range(0, len(infinite_tape)):

            if infinite_tape[temp_index] == '1' or infinite_tape[temp_index] == '0':
                continue
            else:
                del temp_index
                raise self.ElementError('Please input only 1s and 0s for the tape')

        del temp_index

        self.infinite_tape = str(infinite_tape)
        self.infinite_scope = 10  # What we mean by 'infinity'

        self.infinite_tape = self.infinite_scope * '0' + self.infinite_tape + self.infinite_scope * '0'
        del self.infinite_scope

        self.internal_state = '0'  # Initially 0
        self.instructions = {
            '0': ('00R', '10R'),
            '1': ('101L', '11R'),
            '10': ('110R', '1000R'),
            '11': ('01S', '111R'),
            '100': ('1011L', '1001R'),
            '101': ('101L', '1011L')
        }  # Ideally needs to be extracted from tape, with a standard extraction semantic
        """
        Instructions: dict
        
        Use: in storing the instruction aka storing program aka storing algorithm
        
        Currently this has been loaded with an algorithm to double a urinary number (UN * 2)
        The semantics is: Key <-> Internal State, Value Tuple's index <-> 0 index if tape reading is 0, and 1 if 1
        The improper following of the above semantics will produce covert bugs & I have not incorporated a check for it
        """

    def read_instruction(
            self,
            temp_state: str,
            temp_head: int
    ) -> tuple:
        """
        INPUT: The internal state of the turing machine & the last read object
        OUTPUT: The correct string of instruction from instruction dictionary
        Needs to be well versed with the semantics of instruction dictionary

        :param temp_state: the current state of TuringMachine object
        :param temp_head: the current head of the tape being read, integer 0 or 1
        """
        try:
            temp_state = str(temp_state)  # Assumes the self.instructions dictionary have
            temp_head = int(temp_head)  # The indirect index of the tuple value of the self.instructions dict
            # The above comments may be clear from the structure of self.instructions dict in __init__ of TuringMachine

            instruction = self.instructions[temp_state][temp_head]

            del temp_state
            del temp_head

            # The following return statement assumes the correct semantics of the self.instructions dictionary
            # May lead to covert bugs
            return instruction[-1], instruction[-2], int(instruction[:-2])

        except TypeError:
            raise TypeError('Wrong inputs to read_instructions, \n \
            The semantics of the instructions dictionary may have changed')

        except KeyError:
            raise KeyError('Key not found inside the instructions dictionary for this object')

        except Exception as e:
            raise Exception(e)

    def turing_on(
            self
    ) -> str:

        iterator_index = 0
        while True:  # Starting the infinite juggling, this might lead to covert errors intermittently
            try:
                current_head = int(self.infinite_tape[iterator_index])  # supposed to be 0 or 1

                movement, rewrite, self.internal_state = self.read_instruction(self.internal_state, current_head)

                self.infinite_tape = self.infinite_tape[:iterator_index] + rewrite + self.infinite_tape[iterator_index + 1:]

                if movement.upper() == 'R':
                    iterator_index = iterator_index + 1
                elif movement.upper() == 'L':
                    iterator_index = iterator_index - 1
                else:
                    raise self.HaltingError('The modular monster Halted')

            except IndexError:
                raise IndexError('Maybe the tape is not sufficiently "Infinite",\
                                 the algorithm needs more rough paper!\
                                 Try increasing the Tape Length\n')

            except self.HaltingError:
                print('The program halted!, take note of your output\n')
                return self.infinite_tape

            except Exception as e:
                raise Exception(f'Some unexpected error happened:, {e}\n')

    class HaltingError(
        Exception
    ):
        """A custom halting exception"""
        pass

    class ElementError(
        Exception
    ):
        """A custom tape error"""
        pass


# Switching on the modular monster
UN_2 = TuringMachine('01110')

print(UN_2.turing_on())
# Rather long(?) proof of the Mr. Turing completeness of python. Just realised, I can apply for passing the turing test!
