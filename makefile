all: build
		
build:
	docker build -t m2i3/ssh-automation:latest ./	

test-server:
	docker  run --rm -it --name test-docker-ssh-automation.0 -p 49156:22 m2i3/ssh-automation:latest server --user=www-data --command="rsync --server -vlogDtprRze.iLs --delete . /home/www-data/test1/" --command="rsync --server -vlogDtprz --delete . /home/www-data/test1/" --command=/bin/bash --pub-id-rsa="c3NoLXJzYSBBQUFBQjNOemFDMXljMkVBQUFBREFRQUJBQUFCQVFEdW93WE5rV3A5TXhkcElHUHkxMTE3RkJvMExybWZMNitvYnF3UEJoRTN4VGIvdzZFdS9uMFRoV2NzY04vbk1kZ0JFMkI2b1J0akM3OFB5Q1FyNVYyY1dyZ3BRRWtNVGtZRFFpM1ZCaHZrRWp2ekcxUVRvd1hIaDZQYlFuZEVLU3AvZVk0aXNyYTJQZ1ZKTXMxamMwWVh2b05JVm9JTjlhWVhGd3ZXOHFaeHREYUhUSkpDYlVGTDBwd09XUnpWdU4zcm9wWFpiY20rU21xTHlsYlZVRzhLQVpmWEpWaU9UVmlTbXkwRHpYL3IzdGlYNUttK1VuMkdUMFRBOVRSd21XNlM0dHRoTFFMNkRnaXJQRjJZVzVNOGRVOWNDeWx0citXQ2Z5S0x6TjE2dGNreWRKL3N1VWpXcysvNDZ2T2hLYUdJem1yZ1JrZndzNGIvQWZ1UVJpM1ggamVhbi1tYXJjQGplYW4tbWFyYy1NYWNib29rLmxvY2FsCg==" 

test-client:
	docker run --rm -it  m2i3/ssh-automation:latest client --user=www-data --command="rsync --relative -avz --delete -e 'ssh -vvv -o StrictHostKeyChecking=no -p 49156' /etc/* www-data@192.168.59.103:/home/www-data/test1/" --id-rsa="LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFcEFJQkFBS0NBUUVBN3FNRnpaRnFmVE1YYVNCajh0ZGRleFFhTkM2NW55K3ZxRzZzRHdZUk44VTIvOE9oCkx2NTlFNFZuTEhEZjV6SFlBUk5nZXFFYll3dS9EOGdrSytWZG5GcTRLVUJKREU1R0EwSXQxUVliNUJJNzh4dFUKRTZNRng0ZWoyMEozUkNrcWYzbU9JcksydGo0RlNUTE5ZM05HRjc2RFNGYUNEZldtRnhjTDF2S21jYlEyaDB5UwpRbTFCUzlLY0Rsa2MxYmpkNjZLVjJXM0p2a3BxaThwVzFWQnZDZ0dYMXlWWWprMVlrcHN0QTgxLzY5N1lsK1NwCnZsSjloazlFd1BVMGNKbHVrdUxiWVMwQytnNElxenhkbUZ1VFBIVlBYQXNwYmEvbGduOGlpOHpkZXJYSk1uU2YKN0xsSTFyUHYrT3J6b1NtaGlNNXE0RVpIOExPRy93SDdrRVl0MXdJREFRQUJBb0lCQVFETStpRFE2M2hCNUhIVwpiZWtNUFd0aGZlbm9LcjVzZXNSeWMrVzgzZVJLT0U4K3IrWXlmSXdwQ1d5TzRzR2dUOU1QVVhxTXV2ZlFRdFd4Cms2Tm1SUlQ4YVh4SWlweDBRb09tNXVDQlcwYjN4NlhROHdkcitwckxRYnBBYXI0UlFSN3M4aGRodklwdXphVXkKczcxeUVDRUQ0alBZSGQ2R2FSdHFOL1NHaEZUdDBrcHJVZmJzV2tHbGg5ME8zVWVXS1hHc3E0cHd0ZU5kSE9ldgoxZDMvbnlXWmkzdXJZZVZIRWNqVXlDT3R1WnJiQUJQVDJRQ2RRakVBeHpBYXNOOUFhWmFzSGN0K0VLVENNcHU2ClNKMGJoZ3BHTzQ0NjZ0alY4UDVLWU13eEI0ZjMwd2QyK0lKU1JrVFZXd0xTUmRNSjRQRVB0Q1crNlNPMzIzaWoKMmZYTXZPZVJBb0dCQVBkTC9mUk5YMEtZMmR6blgzb0Z4RFhEZ1pyWmRYdVJ5clVqNjZXckRvUDRGYmR1ZkNHSwpodEU1YmNPeEUxSDlLT1JlLzl4UEtMTXRWZTRmL1VLL0RTT3NjK2J2TnlySitBVmtoVGVRTVE5c2ZMVzVrNlVVCmxDdjcwazBWVERhK24zd3RGZEtmSEg3N1RDWVRzTnEyOXArVTVPZktPbWl5cnFCbE1RNDJlUVVaQW9HQkFQY0oKQWkza211VHdEc2I5TXZQTGFzRlFVZUYwWmFGU29TcWVIdU1nc1hLdWowdDg4TjFMYkZjb3RxQUcrd2FyZytUNApSY3dBSTE5ZFZaUWZXTyt6VExHS3BYbERsbVVkZmx2T054Y0dLaGp4RlV4VHhqU3hVdmZrQVg2YndPUW1IcW1qCld2TGo3b3pJdGZkYldVd1hPYmhmcUlkalRvRnpyUUxNbkVmZ203aHZBb0dBTStSR1RkVk9mL01EQkUrb3dUb2sKaWdPVVZxSDYvUXNDdGkvcmFzQVNNNjhESDVLWGlaSS81L2RkQ1F0SE9wVWMxNDczc1lzS3gwNWtFYXUwd1NURgo1UTV5NDZxZXNPUGduNEVRVXpCMm12M3d6VkU3b2hCSFoxTllOY1NhVVlKK2hOZ1JGRGsvQ1laQjNGdVZhTStyCndLREZ4NzJ2cy9pS25DMmZ0WlBJb1VFQ2dZQWVRTkl0Z0tPZmllNmxXL2pUZG9QNmJMVzZZS0Rab3Q3dDh6TmgKS1czUjE2TGc0Y28xcjdqeTY1K0I5WmprZGpqTzM4RGNmTi9ZRy93UkNjM0FmVHJWTzErTWZFUjgyYUhSNkcxQwp1cFNKUFcwWVRlSW1MZGsxVm8wQVRsN1BFZ1FMVG1BakF0c0NEc3FLSW52TEg4VUgyVjh3Ulc4bDExN0d5dndRCnFXY29yUUtCZ1FESGxrVE92dU1LZnpQdGdVRHRqcXIrVVE4ZmhpeHNWYUVtdHRPR3ZVcmF5S1hncUk4a3kxbHgKc0tIb016ckc3Ym5MblpZYlUzMldkbUpuVjNTZVhSbWhRTkxQN0p0eUdwOVY1NjE5L3AwN3NLdVR0T0dEZDVISApLNlMrNVlRZWczRjRSeXV6Wk5meWxtN3VaWm1HM0orejFHYUE2L3JibjZMa09qS3V6OUNrMXc9PQotLS0tLUVORCBSU0EgUFJJVkFURSBLRVktLS0tLQo="

test-interactive-client:
	docker run --rm -it  m2i3/ssh-automation:latest client --user=www-data --command="ssh  -o StrictHostKeyChecking=no -p 49156 www-data@192.168.59.103 /bin/bash" --id-rsa="LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFcEFJQkFBS0NBUUVBN3FNRnpaRnFmVE1YYVNCajh0ZGRleFFhTkM2NW55K3ZxRzZzRHdZUk44VTIvOE9oCkx2NTlFNFZuTEhEZjV6SFlBUk5nZXFFYll3dS9EOGdrSytWZG5GcTRLVUJKREU1R0EwSXQxUVliNUJJNzh4dFUKRTZNRng0ZWoyMEozUkNrcWYzbU9JcksydGo0RlNUTE5ZM05HRjc2RFNGYUNEZldtRnhjTDF2S21jYlEyaDB5UwpRbTFCUzlLY0Rsa2MxYmpkNjZLVjJXM0p2a3BxaThwVzFWQnZDZ0dYMXlWWWprMVlrcHN0QTgxLzY5N1lsK1NwCnZsSjloazlFd1BVMGNKbHVrdUxiWVMwQytnNElxenhkbUZ1VFBIVlBYQXNwYmEvbGduOGlpOHpkZXJYSk1uU2YKN0xsSTFyUHYrT3J6b1NtaGlNNXE0RVpIOExPRy93SDdrRVl0MXdJREFRQUJBb0lCQVFETStpRFE2M2hCNUhIVwpiZWtNUFd0aGZlbm9LcjVzZXNSeWMrVzgzZVJLT0U4K3IrWXlmSXdwQ1d5TzRzR2dUOU1QVVhxTXV2ZlFRdFd4Cms2Tm1SUlQ4YVh4SWlweDBRb09tNXVDQlcwYjN4NlhROHdkcitwckxRYnBBYXI0UlFSN3M4aGRodklwdXphVXkKczcxeUVDRUQ0alBZSGQ2R2FSdHFOL1NHaEZUdDBrcHJVZmJzV2tHbGg5ME8zVWVXS1hHc3E0cHd0ZU5kSE9ldgoxZDMvbnlXWmkzdXJZZVZIRWNqVXlDT3R1WnJiQUJQVDJRQ2RRakVBeHpBYXNOOUFhWmFzSGN0K0VLVENNcHU2ClNKMGJoZ3BHTzQ0NjZ0alY4UDVLWU13eEI0ZjMwd2QyK0lKU1JrVFZXd0xTUmRNSjRQRVB0Q1crNlNPMzIzaWoKMmZYTXZPZVJBb0dCQVBkTC9mUk5YMEtZMmR6blgzb0Z4RFhEZ1pyWmRYdVJ5clVqNjZXckRvUDRGYmR1ZkNHSwpodEU1YmNPeEUxSDlLT1JlLzl4UEtMTXRWZTRmL1VLL0RTT3NjK2J2TnlySitBVmtoVGVRTVE5c2ZMVzVrNlVVCmxDdjcwazBWVERhK24zd3RGZEtmSEg3N1RDWVRzTnEyOXArVTVPZktPbWl5cnFCbE1RNDJlUVVaQW9HQkFQY0oKQWkza211VHdEc2I5TXZQTGFzRlFVZUYwWmFGU29TcWVIdU1nc1hLdWowdDg4TjFMYkZjb3RxQUcrd2FyZytUNApSY3dBSTE5ZFZaUWZXTyt6VExHS3BYbERsbVVkZmx2T054Y0dLaGp4RlV4VHhqU3hVdmZrQVg2YndPUW1IcW1qCld2TGo3b3pJdGZkYldVd1hPYmhmcUlkalRvRnpyUUxNbkVmZ203aHZBb0dBTStSR1RkVk9mL01EQkUrb3dUb2sKaWdPVVZxSDYvUXNDdGkvcmFzQVNNNjhESDVLWGlaSS81L2RkQ1F0SE9wVWMxNDczc1lzS3gwNWtFYXUwd1NURgo1UTV5NDZxZXNPUGduNEVRVXpCMm12M3d6VkU3b2hCSFoxTllOY1NhVVlKK2hOZ1JGRGsvQ1laQjNGdVZhTStyCndLREZ4NzJ2cy9pS25DMmZ0WlBJb1VFQ2dZQWVRTkl0Z0tPZmllNmxXL2pUZG9QNmJMVzZZS0Rab3Q3dDh6TmgKS1czUjE2TGc0Y28xcjdqeTY1K0I5WmprZGpqTzM4RGNmTi9ZRy93UkNjM0FmVHJWTzErTWZFUjgyYUhSNkcxQwp1cFNKUFcwWVRlSW1MZGsxVm8wQVRsN1BFZ1FMVG1BakF0c0NEc3FLSW52TEg4VUgyVjh3Ulc4bDExN0d5dndRCnFXY29yUUtCZ1FESGxrVE92dU1LZnpQdGdVRHRqcXIrVVE4ZmhpeHNWYUVtdHRPR3ZVcmF5S1hncUk4a3kxbHgKc0tIb016ckc3Ym5MblpZYlUzMldkbUpuVjNTZVhSbWhRTkxQN0p0eUdwOVY1NjE5L3AwN3NLdVR0T0dEZDVISApLNlMrNVlRZWczRjRSeXV6Wk5meWxtN3VaWm1HM0orejFHYUE2L3JibjZMa09qS3V6OUNrMXc9PQotLS0tLUVORCBSU0EgUFJJVkFURSBLRVktLS0tLQo="

	
	
	