public class Forecast {
    public static double forecastValue(double currentValue, double growthRate, int years) {
        if (years == 0) {
            return currentValue;
        }
        double nextValue = currentValue * (1 + growthRate);
        return forecastValue(nextValue, growthRate, years - 1);
    }

    public static void main(String[] args) {
        double initialValue = 1000.0; 
        double annualGrowthRate = 0.10; 
        int years = 5; 
        double futureValue = forecastValue(initialValue, annualGrowthRate, years);
        System.out.printf("Predicted future value after %d years: ₹%.2f\n", years, futureValue);
    }
}
