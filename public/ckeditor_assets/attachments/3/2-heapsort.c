// wap to implement  Heapm Sort

#include "stdio.h"
#include "stdlib.h"
#include "time.h"

int swap(int* a, int* b){
	int temp = *a;
	*a = *b;
	*b = temp;
}

int sizeOfHeap(int arr[]){
	int i;
	i = sizeof(arr)/sizeof(arr[0]);
	return i;
}

void heapify( int arr[], int i, int n){
	int left=(i << 1)+1, right = (i+1) << 1, largest = i;

	if(left < n && arr[left] > arr[i])
		largest = left;

	if(right < n && arr[right] > arr[largest])
		largest = right;

	if (largest != i) // change root if needed
	{
		swap(&arr[i], &arr[largest]);
		heapify(arr, largest, n);
	}
}

void buildHeap(int arr[], int n){
	int i;
	for(i=n/2; i>=0; i--)
		heapify(arr, i, n);
}

void heapSort(int arr[], int n){
	int i;
	buildHeap(arr, n);
	for(i=n-1; i>=1; i--){
		swap(&arr[0], &arr[i]);
		n--;
		heapify(arr,0, n);
	}
}

int main(int argc, char const *argv[])
{
	int i, j, n, arr[10];
	time_t t;
	srand((unsigned) time(&t));

	for(i=0; i<10; i++)
		arr[i] = rand()%1000; //scanf("%d", &arr[i]);

	printf("Entered elements in array : \n");
	for(i=0; i<10; i++)
		printf("%d\t", arr[i]);

	printf("\n");
	heapSort(arr, 10);

	printf("Sorted array : \n");
	for(i=0; i<10; i++)
		printf("%d\t", arr[i]);

	printf("\n");
	return 0;
}