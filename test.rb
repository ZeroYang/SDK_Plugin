res_path="/Users/zwwx/work/projects/2016/GameApp/SDK_Plugin/res"

def addSrcDir(path)
  srouce_group = ""
  tem_dir = ""
  Dir.entries(path).each do |sub|
    if sub != '.' && sub != '..' && sub != '.DS_Store'
      if File.directory?("#{path}/#{sub}")
        p "Dir=" + sub
        srouce_group = sub
        name = File.basename(sub)
        p "name="+name
        #framework文件
        if name.include?".framework"
          p 'framework========'
        elsif name.include?".bundle"
          p 'bundle======'
        else
          addSrcDir("#{path}/#{sub}")
        end
      else
        p "sub:"+sub
        name = File.basename(sub)
        p "name="+name
        if name.include?".a"
          p '.a========'
        end
        if name.include?".h" || name.include?".m" || name.include?".mm" || name.include?".c"
          p 'src file'
        end
        #Utils::GameSDK.setSourceFilePharse(executeTarget,srouce_group,path+"/"+sub)
      end
    end
  end
end

addSrcDir(res_path)