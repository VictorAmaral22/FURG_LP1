public abstract class Shape {
    protected String color;
    protected boolean filled;

    public Shape() {
        this.color = null;
        this.filled = false;
    }

    public Shape(String color, boolean filled) {
        this.filled = filled;
        if (filled) {
            this.color = color;
        } else {
            this.color = null;
        }
    }

    public void setFilled(boolean filled) {
        this.filled = filled;
        if (!filled) {
            this.color = null;
        }
    }

    public boolean isFilled() {
        return filled;
    }

    public void setColor(String color) {
        if (filled) {
            this.color = color;
        }
    }

    public String getColor() {
        return color;
    }

    public abstract double getArea();

    public abstract double getPerimeter();

    public String toString() {
        return "Shape - cor=" + color + ", preenchido=" + filled;
    }
}
