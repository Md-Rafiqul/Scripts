$branch = git branch --show-current

if ($branch -ne 'master'){
    git push --set-upstream origin $branch`:$branch
} else {
    git push -u origin master
} 
