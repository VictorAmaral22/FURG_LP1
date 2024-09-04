public class Cylinder extends Shape {
    private double radius;
    private double height;

    public Cylinder(double r, double h) {
        super("Cylinder");
        radius = r;
        height = h;
    }

    public double area() {
        return 2 * 3.14 * radius * (radius + height);
    }

    public String toString() {
        return super.toString() + " raio=" + radius + ", altura=" + height;
    }
}
