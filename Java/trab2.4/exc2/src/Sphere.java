public class Sphere extends Shape {
    private double radius;

    public Sphere(double r) {
        super("Sphere");
        radius = r;
    }

    public double area() {
        return 4 * 3.14 * radius * radius; // Fórmula da área de superfície da esfera
    }

    public String toString() {
        return super.toString() + " raio=" + radius;
    }
}
