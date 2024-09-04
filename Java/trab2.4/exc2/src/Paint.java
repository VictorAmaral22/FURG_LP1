public class Paint {
    private double coverage;

    public Paint(double c) {
        coverage = c;
    }

    public double amount(Shape s) {
        double area = s.area();
        System.out.println("Computando quantidade para " + s);
        return area / coverage;
    }
}
