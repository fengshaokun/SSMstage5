package net.test.pojo;

public class Product {
    /**
     * 序号
     */
    private Long id;
    /**
     * 产品编号
     */
    private Long productNo;
    /**
     * 名称
     */
    private String productName;
    /**
     * 产品类型
     */
    private String productType;
    /**
     * 状态，1：有效，2：无效
     */
    private Byte status;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProductNo() {
        return productNo;
    }

    public void setProductNo(Long productNo) {
        this.productNo = productNo;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }
}
