#!/bin/bash

# The file names
DataBaseDir="$HOME/DataBase"
DataBaseFile="$DataBaseDir/DataBase.csv"

# The file paths



currentDay=$(date "+%Y-%m-%d") 
currentTime=$(date "+%H:%M:%S") 

#color
RED='\033[0;31m'
NC='\033[0m'




	function log(){
		echo "$1 $currentTime" >> $DataBaseDir/databaselog_$currentDay.log
	}

	function menu_header(){
		# TODO Just to print welcome menu presntation
		echo -e "\nMy DataBase Projetc [issam Hamani]"
		echo -e "\nplease Choose the below options :" 
	}

	
	 function mult_line(){
		
		# put all element argument in the array matchLine
		local matchLine=( "$@" )

		# Display the matching lines and prompt for user choice
		for (( i=1; i<=${#matchLine[@]}; i++ )); do
			printf "[$i] ${RED} %s ${NC}\n" "${matchLine[$i-1]}"
		done


		while true ;do
			# Get the line number to edit from the user
			read -p "Enter the line number of the data you want to edit (1-${#matchLine[@]}): " line_number

			# Validate the line number
			if [[ $line_number -ge 1 && $line_number -le ${#matchLine[@]} ]]; then
				break ;
			fi
		# If the line number is invalid, prompt the user to try again
    	echo -e "${RED}Invalid line number. Please enter a number between 1 and ${#matchLine[@]}.${NC}"
		done

		
		
		
		# echo "parts ${parts[@]}"
		# # IFS=, read -ra parts <<< "${matchLine[$line_number-1]}"

	
		# exit 1
		search_and_edit "${matchLine[$line_number-1]}"

	 }

	function displaAllData(){
		
		log "Display All Data"
		
		while read -r line; do
			echo -e "${RED} $line ${NC}"
		done < "$DataBaseFile"
	}
	#2
	function search_operation(){
		entry="$1" #entryValue
		Case="$2"  #caseToSearch

			case $Case in
			"Name")
				#Test if ther match from entry
				if  grep -q "\<$entry\>" "$DataBaseFile" ; then

					#search using awk to specify a field that you want to search -> Name = $3
					search=$(awk -F ',' -v search="$entry" '$3 == search' "$DataBaseFile") 
						
						#make new table to put data match 
						matching_lines=()
						while IFS=, read -r date time name email tel mob place msg; do
								matching_lines+=("$date,$time,$name,$email,$tel,$mob,$place,$msg")
						done <<< "$search"

							
							#Test if number of elemt in table = 1 
							if [ "${#matching_lines[@]}" -eq 1 ]; then 
									#if element is one so the match patte is just one line 
									#pass macth line function to edit
									search_and_edit "$matching_lines"
							else
									#if element is multi line 
									#pass macth line function to edit
									mult_line "${matching_lines[@]}"
							fi

				else
					echo -e "${RED}The Pattern that you Match not available.${NC}"
				fi
				;;
			"Email")
				#Test if ther match from entry
					if  grep -q "\<$entry\>" "$DataBaseFile" ; then

						#search using awk to specify a field that you want to search -> Name = $3
						search=$(awk -F ',' -v search="$entry" '$4 == search' "$DataBaseFile") 
							
							#make new table to put data match 
							matching_lines=()
							while IFS=, read -r date time name email tel mob place msg; do
									matching_lines+=("$date,$time,$name,$email,$tel,$mob,$place,$msg")
							done <<< "$search"

								
								#Test if number of elemt in table = 1 
								if [ "${#matching_lines[@]}" -eq 1 ]; then 
										#if element is one so the match patte is just one line 
										#pass macth line function to edit
										search_and_edit "$matching_lines"
								else
										#if element is multi line 
										#pass macth line function to edit
										mult_line "${matching_lines[@]}"
								fi

					else
						echo -e "${RED}The Pattern that you Match not available.${NC}"
					fi
				;;
			"Tel")
				#Test if ther match from entry
					if  grep -q "\<$entry\>" "$DataBaseFile" ; then

						#search using awk to specify a field that you want to search -> Name = $3
						search=$(awk -F ',' -v search="$entry" '$5 == search' "$DataBaseFile") 
							
							#make new table to put data match 
							matching_lines=()
							while IFS=, read -r date time name email tel mob place msg; do
									matching_lines+=("$date,$time,$name,$email,$tel,$mob,$place,$msg")
							done <<< "$search"

								
								#Test if number of elemt in table = 1 
								if [ "${#matching_lines[@]}" -eq 1 ]; then 
										#if element is one so the match patte is just one line 
										#pass macth line function to edit
										search_and_edit "$matching_lines"
								else
										#if element is multi line 
										#pass macth line function to edit
										mult_line "${matching_lines[@]}"
								fi

					else
						echo -e "${RED}The Pattern that you Match not available.${NC}"
					fi
				;;
			"Mob")
				
					if  grep -q "\<$entry\>" "$DataBaseFile" ; then

						#search using awk to specify a field that you want to search -> Name = $3
						search=$(awk -F ',' -v search="$entry" '$6 == search' "$DataBaseFile") 
							
							#make new table to put data match 
							matching_lines=()
							while IFS=, read -r date time name email tel mob place msg; do
									matching_lines+=("$date,$time,$name,$email,$tel,$mob,$place,$msg")
							done <<< "$search"

								
								#Test if number of elemt in table = 1 
								if [ "${#matching_lines[@]}" -eq 1 ]; then 
										#if element is one so the match patte is just one line 
										#pass macth line function to edit
										search_and_edit "$matching_lines"
								else
										#if element is multi line 
										#pass macth line function to edit
										mult_line "${matching_lines[@]}"
								fi

					else
						echo -e "${RED}The Pattern that you Match not available.${NC}"
					fi
				;;
			"Place")
				#Test if ther match from entry
					if  grep -q "\<$entry\>" "$DataBaseFile" ; then

						#search using awk to specify a field that you want to search -> Name = $3
						search=$(awk -F ',' -v search="$entry" '$7 == search' "$DataBaseFile") 
							
							#make new table to put data match 
							matching_lines=()
							while IFS=, read -r date time name email tel mob place msg; do
									matching_lines+=("$date,$time,$name,$email,$tel,$mob,$place,$msg")
							done <<< "$search"

								
								#Test if number of elemt in table = 1 
								if [ "${#matching_lines[@]}" -eq 1 ]; then 
										#if element is one so the match patte is just one line 
										#pass macth line function to edit
										search_and_edit "$matching_lines"
								else
										#if element is multi line 
										#pass macth line function to edit
										mult_line "${matching_lines[@]}"
								fi

					else
						echo -e "${RED}The Pattern that you Match not available.${NC}"
					fi
				;;
			"Message")
				#Test if ther match from entry
					if  grep -q "\<$entry\>" "$DataBaseFile" ; then

						#search using awk to specify a field that you want to search -> Name = $3
						search=$(awk -F ',' -v search="$entry" '$8 == search' "$DataBaseFile") 
							
							#make new table to put data match 
							matching_lines=()
							while IFS=, read -r date time name email tel mob place msg; do
									matching_lines+=("$date,$time,$name,$email,$tel,$mob,$place,$msg")
							done <<< "$search"

								
								#Test if number of elemt in table = 1 
								if [ "${#matching_lines[@]}" -eq 1 ]; then 
										#if element is one so the match patte is just one line 
										#pass macth line function to edit
										search_and_edit "$matching_lines"
								else
										#if element is multi line 
										#pass macth line function to edit
										mult_line "${matching_lines[@]}"
								fi

					else
						echo -e "${RED}The Pattern that you Match not available.${NC}"
					fi
				;;
			*)
				echo -e "${RED}Invalid choice.${NC}"
				;;
					esac
		

		
	}
	#3
	function search_and_edit(){
		
		# Extract the fields of the chosen line
		IFS=',' read -r date time name email tel mob place msg <<< "$1"

		parts=("$date" "$time" "$name" "$email" "$tel" "$mob" "$place" "$msg")
		
		
		menu_header

		while  true 
			do
				# Display the menu
				echo -e "Search / ${RED}Edit by:${NC}"
				echo "1. Name    :" ${parts[2]}
				echo "2. Email   :" ${parts[3]}
				echo "3. Tel     :" ${parts[4]}
				echo "4. Mob     :" ${parts[5]}
				echo "5. Place   :" ${parts[6]}
				echo "6. Message :" ${parts[7]}
				echo -e "7.${RED} save ${NC}   :"

				echo -e "${RED}x.${NC} Exit "
				
				echo "-----------------------------------------------"
				# Get user input

					read -p "Please Choose the field to be Edite : " choice
				
					case $choice in
						1)
							##Name
							read -p "pleas Entre the Name :" parts[2]
								validate_entry "Name" ${parts[2]}
							;;
						2)
							##Email
							read -p "pleas Entre the Email :" parts[3]
							
								validate_entry "Email" ${parts[3]}
							;;
						3)
							read -p "pleas Entre the Tel :" parts[4]

								validate_entry "Tel" ${parts[4]}
							;;
						4)
							read -p "pleas Entre the Mobile :" parts[5]
								
								validate_entry "Mob" ${parts[5]}
							;;
						5)
							read -p "pleas Entre the Place :" parts[6]

								validate_entry "Place" ${parts[6]}
							;;
						6)
							read -p "pleas Entre the Message :" parts[7]


							;;
						7)
							new_line="$(date "+%Y-%m-%d"),$currentTime,${parts[2]},${parts[3]},${parts[4]},${parts[5]},${parts[6]},${parts[7]}"
							
							log "Edit in File {$new_line}"
							sed -i "s|$1|$new_line|" "$DataBaseFile"

							if [ $? -ne 0 ];then
								echo -e "${RED}someThing Worng. Plese try again !.${NC}"
								break 
							else
								echo "Save."
								break
							fi
							;;
						x)
							log "Exiting the menu."
							echo "Exiting the menu."
							break
							;;
						
						*)
							echo "Invalid choice. Please enter a number From List."
							;;
					esac

			done
	}

	#1
	function field_menu(){
		# TODO to print a selected user information 
		# Name, Email, Tel no, Mob num, Address, Message
			menu_header

		while  true 
			do
				# Display the menu
				echo -e "${RED}Search ${NC}/ Edit by:"
				echo "1. Name    :" 
				echo "2. Email   :"
				echo "3. Tel     :" 
				echo "4. Mob     :" 
				echo "5. Place   :" 
				echo "6. Message :" 
				echo "7. All     :"

				echo -e "${RED}x.${NC} Exit "
				
				echo "-----------------------------------------------"
				# Get user input

					read -p "Please Choose the field to be searched : " choice
				
					case $choice in
						1)
							##Name
							read -p "pleas Entre the Name :" Name
								validate_entry "Name" "$Name"
								if [ $? -eq 0 ] ; then 
									#search
										# $1 this argument for value to search
										# $2 this argument for case to chosse 
									 search_operation "$Name" "Name" 
								fi	

							;;
						2)
							##Email
							read -p "pleas Entre the Email :" Email
								validate_entry "Email" "$Email"
								if [ $? -eq 0 ] ; then 
									#search
										# $1 this argument for value to search
										# $2 this argument for case to chosse 
									 search_operation "$Email" "Email" 
								fi	
								
							;;
						3)
							read -p "pleas Entre the Tel :" Tel
								validate_entry "Tel" "$Tel"
								if [ $? -eq 0 ] ; then 
									#search
										# $1 this argument for value to search
										# $2 this argument for case to chosse 
									 search_operation "$Tel" "Tel" 
								fi
							;;
						4)
							read -p "pleas Entre the Mobile :" Mob
							validate_entry "Mob" "$Mob"
								if [ $? -eq 0 ] ; then 
									#search
										# $1 this argument for value to search
										# $2 this argument for case to chosse 
									 search_operation "$Mob" "Mob" 
								fi
							;;
						5)
							read -p "pleas Entre the Place :" Place
							validate_entry "Place" "$Place"
								if [ $? -eq 0 ] ; then 
									#search
										# $1 this argument for value to search
										# $2 this argument for case to chosse 
									 search_operation "$Place" "Place" 
								fi
							;;
						6)
							read -p "pleas Entre the Message :" Message
							validate_entry "Message" "$Message"
								if [ $? -eq 0 ] ; then 
									#search
										# $1 this argument for value to search
										# $2 this argument for case to chosse 
									 search_operation "$Message" "Message" 
								fi
							;;
						7)
								displaAllData
						;;
						x)
							log "Exiting the menu."
							echo "Exiting the menu."
							break
							;;
						
						*)
							echo "Invalid choice. Please enter a number [1 - 6]."
							;;
					esac

			done
	}

 

	function add_menu(){

		menu_header

		while  true 
			do
				# Display the menu
				echo "Menu:"
				echo "1. Name  :" $Name
				echo "2. Email :" $Email
				echo "3. Tel  :" $Tel
				echo "4. Mob :" $Mob
				echo "5. Place :" $Place
				echo "6. Message :" $Message

				echo -e "${RED}x.${NC} Exit "
				
				echo "-----------------------------------------------"
				# Get user input

					read -p "Please Choose the field to be add : " choice
				case $choice in
					1)
						##Name
						read -p "pleas Entre the Name :" Name

							validate_entry "Name" $Name
							

						;;
					2)
						##Email
						read -p "pleas Entre the Email :" Email
						
							validate_entry "Email" $Email
							
						;;
					3)
						read -p "pleas Entre the Tel :" Tel

							validate_entry "Tel" $Tel
						;;
					4)
						read -p "pleas Entre the Mobile :" Mob
							
							validate_entry "Mob" $Mob
						;;
					5)
						read -p "pleas Entre the Place :" Place

							validate_entry "Place" $Place
						;;
					6)
						read -p "pleas Entre the Message :" Message


						;;
					
					x)
						database_entry "$Name" "$Email" "$Tel" "$Mob" "$Place" "$Message" 
						log "Exiting the menu."
						echo "Exiting the menu."
						break
						;;
					
					*)
						echo "Invalid choice. Please enter a number from List."
						;;
				esac


			done


	}

	

	function validate_entry(){
		# TODO Inputs entered by user must be verified and validated as per fields
		# 1. Names should have only alphabets
			if [ $1 == "Name" ] ; then
				name=$2
				if [[ ! $name =~ ^[[:alpha:][:space:]]+$ ]]; then
					echo -e "${RED}Invalid name. Names should have only alphabets.${NC}"
					Name="-----"
					return 1
				else
					return 0	
				fi
			fi
		# 2. Emails must have a @ symbols and ending with .<domain> Eg: user@mail.com

			if [ $1 == "Email" ] ; then
				email=$2
				if [[ ! $email =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
					echo -e "${RED}Emails must have a @ symbols and ending with .<domain> Eg: user@mail.com.${NC}"
					Email="-----"
					return 1
				else
					return 0	
				fi
			fi

		# 3. Mobile/Tel numbers must have 10 digits .

			if [ $1 == "Tel" ] ; then
				tel=$2
				if [[ ! $tel =~ ^[0-9]{10}$ ]]; then
					echo -e "${RED}Tel numbers must have 10 digits.${NC}"
					Tel="-----"
					return 1
				else
					return 0	
				fi
			fi
		# 4. Mobile/Tel numbers must have 10 digits .

			if [ $1 == "Mob" ] ; then
				mob=$2
				if [[ ! $mob =~ ^[0-9]{10}$ ]]; then
					echo -e "${RED}Mobile numbers is Not Match.${NC}"
					Mob="-----"
					return 1
				else
					Mob="+213-$Mob"
					return 0	
				fi
			fi
		# 5. Place must have only alphabets
			if [ $1 == "Place" ] ; then
				place=$2
				if [[ ! $place =~ ^[[:alpha:][:space:]]+$ ]]; then
					echo -e "${RED}Mobile/Tel numbers must have 10 digits.${NC}"
					Place="-----"
					return 1
				else
					return 0	
				fi
			fi
		# 5. Message  alphabets and any char
			# if [ $1 == "Message" ] ; then
			# 	msg=$2
			# 	if [[ ! $msg =~ ^.*$ ]]; then
			# 		echo -e "${RED}Mobile/Tel numbers must have 10 digits.${NC}"
			# 		Message="-----"
			# 		return 1
			# 	else
			# 		return 0	
			# 	fi
			# fi
	}

	 function database_entry(){
		# 	# TODO user inputs will be written to database file
		# 	# 1. If some fields are missing add consicutive ','. Eg: user,,,,,
					#  "$1. Name  
					#  "$2. Email 
					#  "$3. Tel  
					#  "$4. Mob 
					#  "$5. Place 
					#  "$6. Message 
					
					entry="$(date "+%Y-%m-%d"),$currentTime,$1,$2,$3,$4,$5,$6"
					log log "Edit in File {$entry}"
					echo -e "$entry\n" >> $DataBaseFile
	}


	function Main_menu (){

				# Just loop till user exits
			while  true 
			do
				# Display the menu
				echo "Menu:"
				echo "1. Add Entry"
				echo "2. Search / Edit Entry"
				echo -e "${RED}x.${NC} Exit "
				
				echo -e "Note:${RED}script exit timeout is set.${NC}"
				echo "-----------------------------------------------"
				# Get user input
			

				# Process the user's choice
					
				if read -t 10 ;then #this condtion for time exp
					
					read -p "Please Choose you option : " choice
					case $choice in
						1)
							add_menu
							;;
						2)
							
							field_menu
							# Add code for Option 2
							;;
						x)
							log "Exiting the menu." 
							echo "Exiting the menu."
							exit 0
							;;
						
						*)
							echo "Invalid choice. Please enter a number [ 1  2]."
							;;
					esac

				else
					echo -e "The time Has expired"
					exit 0
				fi
			done

	}

	function Main_menu_add (){

				# Just loop till user exits
			while  true 
			do
				# Display the menu
				echo "Menu:"
				echo "1. Add Entry"
				echo -e "${RED}x.${NC} Exit "
				
				echo -e "Note:${RED}script exit timeout is set.${NC}"
				echo "-----------------------------------------------"
				# Get user input
			

				# Process the user's choice
					
				if read -t 10 ;then #this condtion for time exp
					read -p "Please Choose you option : " choice
					case $choice in
						1)
							add_menu
							
							;;
						x)
							echo "Exiting the menu."
							exit 0
							;;
						
						*)
							echo "Invalid choice. Please enter a number [ 1  2]."
							;;
					esac
				else
					echo -e "The time Has expired"
					exit 0
				fi
			done

	}
		




# 1. Creating a database directory if it doesn't exist

	if [ ! -d "$DataBaseDir" ];then
	    echo "Creating Directory......"
		
		mkdir -p "$DataBaseDir"
		
			if [ $? -eq 0 ];then
				echo "Directory '$DataBaseDir' created successfully.!"
			else
				echo "Something worng please try again"
			fi
	fi
# 2. Creating a database.csv file if it doesn't exist

	if [ ! -e "$DataBaseFile" ];then
	    echo "Creating File......"
		touch  "$DataBaseFile"
			if [ $? -eq 0 ];then
				echo "File '$DataBaseFile' created successfully.!"
				else
				echo "Something worng please try again"
			fi
	fi

##log the excute of script



##Test If File Is Empty Or not if Empty show Menu Just with Add option else Show the normal Menu
if [ -s "$DataBaseFile" ] ;then
		log "Script Runnig" 
		menu_header
		Main_menu
else
		log "Script Runnig" 
		menu_header
		Main_menu_add
fi







