require 'net/ftp'
class FtpWrapper

	def self.upload(source_file_path)
		ftp = Net::FTP.new('localhost')
		#login with (username,password)
		ftp.login('ray-ftp','ftp') 
		#In this system FTP Home directory for ray-ftp user is /ftpuploads
		#entering sub-directory uploadedfiles
		ftp.chdir('uploadedfiles') 
		#(filename,destination_save,block_size)
		ftp.putbinaryfile(source_file_path,File.basename(source_file_path), 1024)
		ftp.close
	end

	def self.download(download_file_name)
		puts download_file_name
		ftp = Net::FTP.new('localhost')
		#login with (username,password)
		ftp.login('ray-ftp','ftp') 
		#In this system FTP Home directory for ray-ftp user is /ftpuploads
		#entering sub-directory uploadedfiles
		ftp.chdir('uploadedfiles')
		p ftp.pwd
		#(filename,destination_save,block_size)
		ftp.getbinaryfile(download_file_name,"/tmp/#{download_file_name}", 1024)

		ftp.close
	end

end