public class main {
    public static void main(String[] args) {

        Shape circle = new Circle(7, "azul", true);
        Shape square = new Square(5, "azul", false);
        Shape rectangle = new Rectangle(3, 6, "preto", true);
        Shape shape = new Shape("verde", true) {
            public double getArea() {
                return 0;
            }

            public double getPerimeter() {
                return 0;
            }
        };

        rectangle.setFilled(false);

        showInfo(circle);
        showInfo(square);
        showInfo(rectangle);
        showInfo(shape);
    }

    public static void showInfo(Shape shape) {
        System.out.println(shape.toString());
    }
    
}
