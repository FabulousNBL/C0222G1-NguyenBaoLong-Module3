package model.service;

public class Service {
    private int maxCustomer,floorNumber,status,rentTypeId,serviceTypeId;
    private String serviceId,serviceName,standardRoom,otherService;
    private double serviceArea,serviceCost,poolArea;

    public Service(String serviceId,
                   String serviceName,
                   double serviceArea,
                   double serviceCost,
                   int maxCustomer,
                   int rentTypeId,
                   int serviceTypeId,
                   String standardRoom,
                   String otherService,
                   double poolArea,
                   int floorNumber,
                   int status) {
        this.maxCustomer = maxCustomer;
        this.floorNumber = floorNumber;
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.rentTypeId = rentTypeId;
        this.serviceTypeId = serviceTypeId;
        this.standardRoom = standardRoom;
        this.otherService = otherService;
        this.serviceArea = serviceArea;
        this.serviceCost = serviceCost;
        this.poolArea = poolArea;
        this.status= status;
    }


    public Service(String serviceId,
                   String serviceName,
                   double serviceArea,
                   double serviceCost,
                   int maxCustomer,
                   int rentTypeId,
                   int serviceTypeId,
                   String standardRoom,
                   String otherService,
                   double poolArea,
                   int floorNumber
                  ) {
        this.maxCustomer = maxCustomer;
        this.floorNumber = floorNumber;
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.rentTypeId = rentTypeId;
        this.serviceTypeId = serviceTypeId;
        this.standardRoom = standardRoom;
        this.otherService = otherService;
        this.serviceArea = serviceArea;
        this.serviceCost = serviceCost;
        this.poolArea = poolArea;

    }

    public int getMaxCustomer() {
        return maxCustomer;
    }

    public void setMaxCustomer(int maxCustomer) {
        this.maxCustomer = maxCustomer;
    }

    public int getFloorNumber() {
        return floorNumber;
    }

    public void setFloorNumber(int floorNumber) {
        this.floorNumber = floorNumber;
    }

    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public int getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(int rentTypeId) {
        this.rentTypeId = rentTypeId;
    }

    public int getServiceTypeId() {
        return serviceTypeId;
    }

    public void setServiceTypeId(int serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getOtherService() {
        return otherService;
    }

    public void setOtherService(String otherService) {
        this.otherService = otherService;
    }

    public double getServiceArea() {
        return serviceArea;
    }

    public void setServiceArea(double serviceArea) {
        this.serviceArea = serviceArea;
    }

    public double getServiceCost() {
        return serviceCost;
    }

    public void setServiceCost(double serviceCost) {
        this.serviceCost = serviceCost;
    }

    public double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
