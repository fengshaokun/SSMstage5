package net.test.pojo;

public class CityDto {

    private int pId;
    private String proName;

    @Override
    public String toString() {
        return "CityDto{" +
                "pId=" + pId +
                ", proName='" + proName + '\'' +
                '}';
    }

    public CityDto() {
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public CityDto(int pId, String proName) {
        this.pId = pId;
        this.proName = proName;

    }
}
