public class Rectangle extends Shape {
    protected double width;
    protected double heigth;

    public Rectangle(double width, double heigth, String color, boolean filled) {
        super(color, filled);
        this.width = width;
        this.heigth = heigth;
    }

    public void setWidth(double width) {
        this.width = width;
    }

    public void setHeigth(double heigth) {
        this.heigth = heigth;
    }

    public double getArea() {
        return width * heigth;
    }

    public double getPerimeter() {
        return 2 * (heigth+width);
    }

    public String toString() {
        return "Retângulo - altura=" + heigth + ", base=" + width + ", cor=" + color + ", preenchido=" + filled;
    }

}