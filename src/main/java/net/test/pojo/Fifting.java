package net.test.pojo;

public class Fifting {
    private String type;
    private String name;
    private String pair;

    public Fifting(String type, String name, String pair) {
        this.type = type;
        this.name = name;
        this.pair = pair;
    }

    public Fifting() {
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPair() {
        return pair;
    }

    public void setPair(String pair) {
        this.pair = pair;
    }

    @Override
    public String toString() {
        return "FiftingMapper{" +
                "type='" + type + '\'' +
                ", name='" + name + '\'' +
                ", pair='" + pair + '\'' +
                '}';
    }
}
