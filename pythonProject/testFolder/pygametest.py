import pygame, time

pygame.init()


def main():
    screen = pygame.display.set_mode((500, 500))

    pygame.display.set_caption("Vishal Ka Test")

    run = True
    while run:


        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                run = False
                break
        for i in range(0, 400):
            screen.fill("WHITE")
            pygame.draw.circle(screen, "RED", (250, i), 60)

        pygame.display.update()


main()
