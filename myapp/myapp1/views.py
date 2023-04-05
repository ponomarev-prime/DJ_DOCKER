from django.shortcuts import render
from myapp1.models import ParsedData

# Create your views here.
def index_page(request):
    
    data = ParsedData.objects.all()
    
    return render(request, "index.html", context={'data':data})