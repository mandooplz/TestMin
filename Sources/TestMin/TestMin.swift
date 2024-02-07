
import Foundation

//MARK: Creator


//MARK: Interface


//MARK: Default-Implementaion


//MARK: Implementation
class Province {
    private var name : String = ""
    private var producers : Array<Producer> = []
    private var totalProduction : Int = 0
    private var demand : Int = 30 // demand = 수요
    private var price : Int = 20
    
    init(producers : Array<Producer>) {
        producers.forEach { producer in
            self.producers.append(producer)
        }
    }
    
    func getName() -> String { name }
    @available(iOS 13.0.0, *)
    func getProducers() -> some Collection<Producer> { producers }
    func setProducers(arr : Array<Producer>) {
        self.producers = arr
        producers.forEach { producer in
            self.totalProduction += producer.getProduction()
        }
    }
    func getTotalProduction() -> Int { totalProduction }
    func getDemand() -> Int { demand }
    func getPrice() -> Int { price }
    
    func shortfall() -> Int
    {
        return getDemand() - getTotalProduction()

    }

    func profit() -> Int {
        // 매출
        let satisfiedDemand = min(getDemand(), getTotalProduction())
        let demandValue = satisfiedDemand * getPrice()
        
        
        // 비용
        var remainingDemand = getDemand()
        var demandCost = 0
        getProducers()
            .sorted { $0.getCost() < $1.getCost() }
            .forEach { producer in
                let contribution = min(remainingDemand, producer.getProduction() )
                remainingDemand -= contribution
                demandCost += contribution * producer.getCost()
            }
        
        // 이익
        let profit = demandValue - demandCost
        return profit
    }
}

class Producer {
    private weak var province : Province?
    private var cost : Int
    private var name : String
    private var production : Int
    
    init(province: Province, cost: Int, name: String, production: Int) {
        self.province = province
        self.cost = cost
        self.name = name
        self.production = production
    }
    
    func getName() -> String { name }
    func getCost() -> Int { cost }
    func getProduction() -> Int { production }
    

}
