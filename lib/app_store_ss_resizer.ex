defmodule AppStoreSsResizer do
  import Mogrify
  
  @sizes [
    %{output_dir_name: "5.5-inch-retina", size: "1242x2208!"},
    %{output_dir_name: "4.7-inch-retina", size: "750x1334!"},
    %{output_dir_name: "4-inch-retina", size: "640x1136!"},
    %{output_dir_name: "3.5-inch-retina", size: "640x960!"},
  ]
  
  defp resize_images_in_dir(dir) do
    {return, files} = Path.expand(dir) |> File.ls

    if return == :ok do
      image_files = Enum.map(files, &([Path.expand(dir), &1] |> Path.join)) 
      |> Enum.filter(&(Path.extname(&1) == ".png"))
      
      IO.puts "*******************"
      IO.puts "List of images we are going to resize for App Store:\n-#{image_files |> Enum.join("\n-")}"
      IO.puts "*******************\n"
      
      image_files |> Enum.each(fn(image) -> 
        for %{output_dir_name: output_dir_name, size: size} <- @sizes do
          output_dir = [Path.expand(dir), output_dir_name] |> Path.join 
          
          output_dir |> File.mkdir_p
          
          resized_image = [output_dir, "#{Path.basename(image, ".png")}.jpg"] |> Path.join
          
          open(image) 
          |> copy
          |> resize(size)
          |> save(resized_image)
          |> format("jpg") 
          
          IO.puts "#{resized_image} generated!"
        end
      end)
      
      IO.puts "\nFinished with success!\n"
    else
      IO.puts "Failed to retrieve file from dir #{Path.expand(dir)}"
    end
  end
  
  def main(args) do
    {[dir: dir], _, _} = OptionParser.parse(args)
    
    resize_images_in_dir(dir)
  end
end
