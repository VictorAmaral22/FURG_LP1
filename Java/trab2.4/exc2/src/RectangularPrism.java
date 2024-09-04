public class RectangularPrism extends Shape {
    private double height;
    private double width;
    private double length;

    public RectangularPrism(double h, double w, double l) {
        super("Rectangular Prism");
        height = h;
        width = w;
        length = l;
    }

    public double area() {
        return 2 * (height * width + height * length + width * length);
    }

    public String toString() {
        return super.toString() + " altura=" + height + ", largura=" + width + ", comprimento=" + length;
    }
}
