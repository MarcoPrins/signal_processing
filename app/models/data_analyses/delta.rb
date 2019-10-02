# This class is added as an example of how additional types of data analysis would be added when scaling the app.

class DataAnalyses::Delta < DataAnalysis
  def calculate_data
    captured_data = data_capture.data
    result = [nil] # First entry is nil because there is no delta

    for i in 1...captured_data.length do
      result << captured_data[i] - captured_data[i-1]
    end

    result
  end
end
